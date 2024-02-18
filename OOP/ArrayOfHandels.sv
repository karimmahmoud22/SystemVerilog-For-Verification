/*
    purpose: This file contains exapmle of array of handels
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module array_of_handels();

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
        BusTran b_array [10];
        foreach ( b_array[i] ) begin
            b_array[i] = new();              //create one new object
            b_array[i].addr = $random();
            $display("Sending addr = %0h", b_array[i].addr);
            transmit(b_array[i]);
        end
    endtask

    initial begin
        generator_bad(5);
    end

endmodule
