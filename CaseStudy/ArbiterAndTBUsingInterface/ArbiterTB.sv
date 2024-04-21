/*
    purpose: This file contains exapmle of testbench for arbiter
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module arbiter_tb( arb_int a );

    initial begin

        #7; a.rst <=0;
        #5; a.rst <=1;
        #2; a.request <= 2'b01;
        $display("@%0t: Drove request = %0b", $time , a.request);

        repeat(2) @(posedge a.clk);

        assertion_1 : assert (a.grant == 2'b01)
            $display("@%0t: Correct, grant = %0b", $time , a.grant);
            else
            $fatal("@%0t: Error, grant = %0b", $time , a.grant);
        $finish;
    end

endmodule


//TB ==> Here we can use non-blocking assignments only as we use interface

/*
if ( a.grant != 01 )
    $display("@%0t: Error, grant = %0b", $time , a.grant);
else
    $display("@%0t: Correct, grant = %0b", $time , a.grant);
*/