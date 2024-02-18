/*
    purpose: This file contains exapmle of copy of simple class
    Author: Karim Mahmoud Kamal
    Date:    18th of February 2024
*/

module simple_copy_function();

    class BusTran;
        bit [31:0] addr, crc, data[8];
        static int count=0;
        int id;
        Statistics stats;           // Statistics handle

        function BusTran copy();
            copy = new();
            copy.addr = this.addr;
            copy.crc = this.crc;
            copy.data = this.data;
        endfunction

    endclass

    // ---------------------------------------------------------------------------------

    BusTran src, dst;
    initial begin
        src = new();
        dst = src.copy();
    end
endmodule