/*
    purpose: This file contains exapmle of ggod generator that creates so many objects
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module good_generator();

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
        repeat ( n ) begin
            b = new();              //create one new object
            b.addr = $random();
            $display("Sending addr = %0h", b.addr);
            transmit(b);
        end
    endtask

    initial begin
        generator_bad(5);
    end

endmodule
