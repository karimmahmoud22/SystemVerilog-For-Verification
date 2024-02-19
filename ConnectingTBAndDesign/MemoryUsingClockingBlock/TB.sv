/*
    purpose: This file contains exapmle of testbench of memory
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module test ( intf.tb intf_tb );

    initial begin
        // Here we must to use non-blocking assignment
        intf_tb.enable <= 1;
        intf_tb.read <= 1;
        intf_tb.addr <= 7;
        
    end

endmodule