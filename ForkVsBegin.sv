/*
    purpose: This file contains fork vs begin block
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module fork_vs_begin;

    reg a, b, c;
    initial begin: initial_block
        #1 a = 1;
        #5 b = 2;
        #7 c = 3;
    end : initial_block

    initial begin
        $dumpfile("fork_vs_begin.vcd");
        $dumpvars;
        #100 $finish;
    end
  
endmodule

/*
begin block: 
    All statements are executed in sequence
        a after 1 time unit
        b after 6 time units
        c after 13 time units
fork block:
    All statements are executed in parallel
        a after 1 time unit
        b after 5 time units
        c after 7 time units
*/

/*
module fork_vs_begin;

    reg a, b, c;
    initial fork : fork_block
        #1 a = 1;
        #5 b = 2;
        #7 c = 3;
    join : fork_block

    initial begin
        $dumpfile("fork_vs_begin.vcd");
        $dumpvars;
        #100 $finish;
    end
  
endmodule


*/