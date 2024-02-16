/*
    purpose: This file contains out of block routine declaration
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module routines_in_class ();

    class BusTran;
        bit [31:0] addr, crc, data[8];
        extern function void display();
    endclass

    // Here if you missing the class name ==> error data[i] and addr are not defines
    function void BusTran::display();
        $display("Address: %0h, CRC: %0h", addr, crc);
        $write("\tdata[0-7]=");
        foreach( data[i] ) begin
            $write(data[i]);
        end
        $display();
    endfunction

    class PCI_Tran;
        bit [31:0] addr, data;

        extern function void display();

    endclass

    function void PCI_Tran::display();
        $display("Address: %0h, DATA: %0h", addr, data);
    endfunction


    BusTran b;
    PCI_Tran pc;

    initial begin 
        b = new();
        b.display();

        pc = new();
        pc.display();
    end
endmodule