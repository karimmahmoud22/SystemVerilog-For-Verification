/*
    purpose: This file contains exapmle of top module of arbiter
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module top();

    bit clk;
    arb_int a( clk );
    arbiter arbiter_inst(a);
    arbiter_tb arbiter_tb_inst(a);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("arbiter.vcd");
        $dumpvars;
        #100 $finish;
    end

endmodule