/*
    purpose: This file contains some routines in class
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module routines_in_class ();

    class BusTran;
        bit [31:0] addr, crc, data[8];

        function void display();
            $display("Address: %0h, CRC: %0h", addr, crc);
            $write("\tdata[0-7]=");
            foreach( data[i] ) begin
                $write(data[i]);
            end
            $display();
        endfunction
    endclass

    class PCI_Tran;
        bit [31:0] addr, data;

        function void display();
            $display("Address: %0h, DATA: %0h", addr, data);
        endfunction

    endclass

    BusTran b;
    PCI_Tran pc;

    initial begin 
        b = new();
        b.display();

        pc = new();
        pc.display();
    end
endmodule