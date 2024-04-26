/*
    purpose: This file contains example of a driver class that is used to drive the ATM cells to the DUT.
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/

class Driver;

    int stream_id;
    bit done;
    mailbox exp_mbx;
    virtual Rx_if.TB Rx;

    function new(mailbox exp_mbx, int stream_id, virtual Rx_if.TB Rx);
        this.exp_mbx = exp_mbx;
        this.stream_id = stream_id;
        this.Rx = Rx;
    endfunction

 task run(int ncells, event driver_done);
    ATM_Cell ac;
    fork // Spawn this as a separate thread
        begin
            // Initialize output signals
            Rx.cb.clav <= 0;
            Rx.cb.soc <= 0;
            @Rx.cb; 
            // Drive cells until the last one is sent
            repeat (ncells) begin
                ac = new
                assert(ac.randomize);
                if (ac.eot_cell) 
                    break; // End of transmission
                drive_cell(ac);
            end
            $display("@%0d: Driver::run Driver[%0d] is done", $time, stream_id);
            -> driver_done;
        end
    join_none
 endtask

    task drive_cell(ATM_Cell ac);
        bit [7:0] bytes[];
        #ac.delay;
        ac.byte_pack(bytes);
        $display("@%0d: Driver::drive_cell(%0d) vci=%h", 
        $time, stream_id, ac.vci);
        // Wait to start on a new cycle
        @Rx.cb;
        Rx.cb.clav <= 1; // Assert ready to xfr
        
        do
            @Rx.cb;
        while (Rx.cb.en != 0) // Wait for enable low
        
        Rx.cb.soc <= 1; // Start of cell
        Rx.cb.data <= bytes[0]; // Drive first byte
        @Rx.cb;
        Rx.cb.soc <= 0; // Start of cell done
        Rx.cb.data <= bytes[1]; // Drive first byte
        
        for (int i=2; i<`ATM_SIZE; i++) begin
            @Rx.cb; 
            Rx.cb.data <= bytes[i];
        end
        
        @Rx.cb;
        Rx.cb.soc <= 1'bz; // Tristate SOC at end
        Rx.cb.clav <= 0;
        Rx.cb.data <= 8'bz; // Clear data lines
        $display("@%0d: Driver::drive_cell(%0d) finish", 
        $time, stream_id);
        // Send cell to scoreboard
        exp_mbx.put(ac);
    endtask // drive_cell_t

endclass // Driver