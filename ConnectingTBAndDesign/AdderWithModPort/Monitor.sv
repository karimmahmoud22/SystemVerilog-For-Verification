/*
    purpose: This file contains exapmle of monitor for the adder with mod port
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module monitor (intf.monitor abc);

    always @(posedge abc.a[0] ) begin
        $display("@%0d: asserted a = %0d", $time , abc.a);
    end

    always @(posedge abc.b[0] ) begin
        $display("@%0d: asserted b = %0d", $time , abc.b);
    end

    always @(posedge abc.c[2] ) begin
        #2;
        $display("@%0d: asserted c = %0d", $time , abc.c);
    end


endmodule