/*
    purpose: This file contains exapmle of copy of a class using new
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

    initial begin
        BusTran a, b;
        a = new();
        b = new a;      // make a shallow copy with new
    end

endmodule


/*
    1- Shallow copy is similar to photocopy of the original
    2- If the class contains a handle to another class, only the top level object is copied by new, not the lower level one.

*/