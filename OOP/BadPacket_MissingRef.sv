/*
    purpose: This file contains exapmle of missing ref keyword
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module missing_ref();

    class BusTran;
        bit [31:0] addr, crc, data[8];

        extern task create_packet();
    endclass

    // ---------------------------------------------------------------------------------

    task BusTran::create_packet();
        $display("Creating packet");
    endtask

    // ---------------------------------------------------------------------------------

    task create_packet( ref BusTran bt );
        bt = new();
        bt.addr = 42;
    endtask

    // The following code produce error without using ref as the compiler will consider it unintialized ( effect of create_packet not considered as passing object by value )
    BusTran b;
    initial begin
        create_packet(b);
        $display("The address is: %0d",b.addr);
    end

endmodule