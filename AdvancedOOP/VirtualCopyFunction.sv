/*
    purpose: This file contains example of inheritance in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Transaction;

    randc bit [31:0] src, dst, data[8];
    bit [31:0] crc;

    virtual function Transaction copy();
        copy = new();
        copy.src = src;
        copy.dst = dst;
        copy.data = data;
        copy.crc = crc;
    endfunction
endclass
