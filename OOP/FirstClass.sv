/*
    purpose: This file contains first class examples in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

class BusTran;
    bit [31:0] address, crc, data[8];

    function void display();
        $display("Address: %0h, CRC: %0h", address, crc);
    endfunction: display

    function calc_crc();
        crc = address ^ data.xor();
    endfunction: calc_crc
endclass: BusTran

module first_class();
    initial begin

        BusTran bus;
        /*
            Displaying here will produce the follwoing error:

            The object at dereference depth 0 is being used before it was 
            constructed/allocated.
            Please make sure that the object is allocated before using it. 
            
            bus.display();
        */

        bus = new();
        bus.display();

        bus.address = 32'h12345678;
        bus.data = '{8{8'hFF}};
        bus.calc_crc();
        bus.display();

    end
endmodule: first_class

