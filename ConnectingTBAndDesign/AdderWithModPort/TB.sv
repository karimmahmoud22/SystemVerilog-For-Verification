/*
    purpose: This file contains exapmle of testbench for the adder with mod port
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module test ( intf.tb abc );

    initial begin
        abc.a = 4'b0011;
        abc.b = 4'b0001;
        $display("a = %0d", abc.a);
        $display("b = %0d", abc.b);
        #10;
        $display("c = %0d", abc.c);
        $finish;
    end

endmodule