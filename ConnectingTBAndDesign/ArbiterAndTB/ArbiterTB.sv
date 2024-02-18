/*
    purpose: This file contains exapmle of testbench for arbiter
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module arbiter_tb( grant , request , rst , clk );

    input logic clk ;
    input logic [1:0] grant; 
    output logic rst;
    output logic [1:0] request;

    initial begin

        #7; rst <=0;
        #5; rst <=1;
        #2; request <= 2'b01;
        $display("@%0t: Drove request = %0b", $time , request);

        repeat(2) @(posedge clk);

        if ( grant != 01 )
            $display("@%0t: Error, grant = %0b", $time , grant);
        else
            $display("@%0t: Correct, grant = %0b", $time , grant);

    end

endmodule