/*
    purpose: This file contains exapmle of top module
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module top();

    bit clk;
    always #20 clk = ~clk;

    intf i1 (clk);
    memory m1 ( i1.dut );
    test t1 ( i1.tb );
    initial begin
        $dumpfile( "mem.vcd" );
        $dumpvars;
        #200 $finish;
    end
endmodule