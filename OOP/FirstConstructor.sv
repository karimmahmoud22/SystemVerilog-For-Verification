/*
    purpose: This file contains first constructor examples in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

class BusTran;
    bit [31:0] address, crc, data[8];

    //parameterized constructor with default values
    function new (  input bit [31:0] address=5,
                    input bit [7:0] data =5 );

        this.address = address;
        foreach(data[i])
            this.data[i] = data;
    endfunction: new

    function void display();
        $display("Address: %0h, CRC: %0h", address, crc);
        foreach(data[i])
            $display("Data[%0d]: %0h", i, data[i]);
    endfunction: display

endclass: BusTran

module first_class();
    initial begin

        BusTran bus;
        bus = new();
        bus.display();
        bus = null;     // free the memory

        bus = new(32'h12345678, '{8{8'hFF}});
        bus.display();
        bus = null;     // free the memory

        bus = new(32'h12345678);
        bus.display();
        bus = null;     // free the memory

    end
endmodule: first_class



/*

    //default constructor
    function new ();

        address = 32'h3;

        foreach(data[i])
            data[i] = 8'h5;

    endfunction: new


*/