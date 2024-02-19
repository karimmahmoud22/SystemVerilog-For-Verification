/*
    purpose: This file contains exapmle of memory test bench
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module test ( start, write , addr , data );
    output start, write , addr , data;
    logic start, write;
    logic [7:0] addr , data ;

    initial begin
        start = 0;
        write =0;

        #10;
        start = 1;
        // if we add #0 ( 0 delay here ) it will take the old value not the new one
        addr = 8'h42;
        data = 8'h5A;
        write = 1;
        #50 start =0;

    end

    memory m1 (start, write , addr , data );
endmodule