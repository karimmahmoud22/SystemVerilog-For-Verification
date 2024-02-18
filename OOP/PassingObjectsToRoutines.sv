/*
    purpose: This file contains exapmle of passing objects to routines
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/
module passing_objects();

    class BusTran;
        bit [31:0] addr, crc, data[8];

        extern task create_packet();
    endclass

    // ---------------------------------------------------------------------------------

    task BusTran::create_packet();
        $display("Creating packet");
    endtask

    // ---------------------------------------------------------------------------------

    task generator();
        BusTran b;
        b = new;
        b.addr = 32'hffff_fffa;
        // object is passing here by value so you can not modify it
        // if we want to modify it we must use ref keyword to pass it by reference
        transmit(b);

        // The folloeing line will show the effect of transmit function
        $display("Address is: %0h", b.addr);
    endtask

    task transmit( BusTran b);
        $display("Tranmiting");
        $display("Address before ediring: %h", b.addr);

        // The following line will be ignored ( no error )
        // the object will be modified during the entire function only

        b.addr = 32'haaaa_aaaa;
        $display("Address after editing: %h", b.addr);
    endtask


    initial begin
        generator();
    end

endmodule