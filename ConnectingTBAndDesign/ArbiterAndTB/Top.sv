/*
    purpose: This file contains exapmle of top module of arbiter
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module top();

    logic clk;
    logic rst;
    logic [1:0] grant; 
    logic [1:0] request;

    arbiter arbiter_inst( .grant(grant) , .request(request) , .rst(rst) , .clk(clk) );
    arbiter_tb arbiter_tb_inst( .grant(grant) , .request(request) , .rst(rst) , .clk(clk) );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("arbiter.vcd");
        $dumpvars;
        #100 $finish;
    end

endmodule