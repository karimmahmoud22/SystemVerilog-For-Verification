/*
    purpose: This file contains exapmle of top module of adder
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module top( );
    intf i1();
    adder a1 ( i1.dut );
    test t1 ( i1.tb );
    monitor m1 ( i1.monitor );
endmodule