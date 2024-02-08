/*
    purpose: This file contains some New Types examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/


module new_types();

    // a design parameter ( constant )
    parameter int OPSIZE = 8;

    // define a new type
    // reg is a 4-state variable so default value is x
    typedef reg [OPSIZE-1:0] opreg_t;

    // 4-state variables
    opreg_t opreg_a, opreg_b;

    // 32-bit unsigned 2-state variable
    // bit is a 2-state variable so default value is 0
    typedef bit [31:0] uint32_t1;

    // Equivalent definition
    typedef int unsigned uint32_t2;

    uint32_t1 reg_a;
    uint32_t2 reg_b;

    // 5-element fixed array
    typedef int fixed_array5 [5];
    fixed_array5 arr1;

    initial begin
        foreach( arr1[i] ) begin
            arr1[i] = i;
        end
        $display("1: Unintialized opreg_a: ", opreg_a);
        $display("2: Unintialized reg_a: ",    reg_a);
        $display("3: Intialized arr1: ",    arr1);
    end

endmodule