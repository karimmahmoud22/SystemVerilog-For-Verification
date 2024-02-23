/*
    purpose: This file contains exapmle of testbench for the adder with mod port
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

program automatic test ( intf.tb abc );

    int count=0;

    initial begin
        abc.a = 4'b0011;
        abc.b = 4'b0001;
        $display("a = %0d", abc.a);
        a1: assert (abc.a == 4'b0011) 
            ++count;
        else $error("a is not equal to 4'b0011");
        $display("b = %0d", abc.b);
        b1: assert (abc.b == 4'b0001) 
            ++count;
        else $error("a is not equal to 4'b0001");
        #10;
        $display("c = %0d", abc.c);
        c1: assert (abc.c == 4'b0100) 
            ++count;
        else $error("a is not equal to 4'b0100");

        $display("The number of successful assertions is: %0d",count);

        $finish;
    end

endprogram