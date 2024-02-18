/*
    purpose: This file contains exapmle of bad generator that create only one object
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module bad_generator();

    class BusTran;
    bit [31:0] addr, crc, data[8];

    extern task create_packet();
    endclass

    // ---------------------------------------------------------------------------------

    task BusTran::create_packet();
        $display("Creating packet");
    endtask

    // ---------------------------------------------------------------------------------

    task transmit( BusTran b);
        $display("Tranmiting");
    endtask

    task generator_bad( int n);
        // create only one object
        BusTran b;
        b = new();
        repeat ( n ) begin
            b.addr = $random();
            $display("Sending addr = %0h", b.addr);
            transmit(b);
        end
    endtask

    initial begin
        generator_bad(5);
    end

endmodule

/*
    Note: In real testbench we need to make many objects not only one to simulate different transaction with each one having own details
*/