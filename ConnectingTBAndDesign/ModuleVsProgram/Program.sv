/*
    purpose: This file contains exapmle of program
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module design_ex( output bit [7:0] addr );
    initial begin
        addr <=10;
    end
endmodule

program test_bench( input bit [7:0] addr );
    initial begin
        $display("Addr = %0d", addr);
    end
endprogram

module top();
    wire [7:0] addr;
    design_ex(addr);
    test_bench(addr);
endmodule



/*
    ouput is 10 as testbench is defined in program ==> NO race condition
*/