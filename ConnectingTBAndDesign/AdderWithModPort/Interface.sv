/*
    purpose: This file contains exapmle of interface
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

interface intf();
    logic [3:0] a;
    logic [3:0] b;
    logic [4:0] c;

    modport dut ( input a, b , output c );
    modport tb (output a, b , input c);    

endinterface