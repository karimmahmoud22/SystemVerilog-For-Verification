/*
    purpose: This file contains exapmle of memory
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

interface intf ( input bit clk );
    logic read, enable;
    logic [7:0] data, addr;
    
    clocking cb @(posedge clk);
        // 10 is input skew ( input is ready before the posedge of clk by 10 )
        // 2 is output skew ( output is ready after the posedge of clk by 2 )
        default input #10 output #2;
        output read, enable, addr;
        // may make output negedge data ==> change with negedge of the clk
        input data;
    endclocking

    modport dut ( input read , enable, addr, output data );
    modport tb ( clocking cb);

endinterface