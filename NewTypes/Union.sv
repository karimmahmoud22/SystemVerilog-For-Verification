/*
    purpose: This file contains union examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module union1();
    // union is a data type that can store different types of data
    // you can store an int (or) not (and) real number in the same memory location
    typedef union {
        int int_num;
        real real_num;
    } my_union_u;

    my_union_u my_union;

    initial begin
        my_union.real_num = 25.19;
        $display("3: my_union.int_num: %0x", my_union.int_num);
        $display("4: my_union.real_num: %0f", my_union.real_num);
    end

endmodule


/*

Notes:
    You can define a union with many members, 
    but only one member can contain a value at any given time

    Its size is the size of the largest data type of its elements

    Unions are useful when you frequently need to read and write a register in 
    several different formats

    To use unions you must add the argument –lca (Limited Customer Availability) 
    to the command line of the compiler.
    
*/