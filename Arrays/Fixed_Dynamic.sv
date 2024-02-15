/*
    purpose: This file contains assignments between fixed and dynamic arrays
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module fixed_dynamic_array_assignments();

    // Fixed array
    int fixed_array [4];

    // Dynamic array
    int dynamic_array [];

    initial begin
        // Assigning a fixed array to a dynamic array
        fixed_array = '{1, 2, 3, 4};
        $display("1: Fixed array: %p", fixed_array);

        dynamic_array = fixed_array;
        $display("2: Dynamic array: %p", dynamic_array);

        // Assigning a dynamic array to a fixed array
        dynamic_array = '{5, 6, 7, 8};
        $display("3: Dynamic array: %p", dynamic_array);

        fixed_array = dynamic_array;
        $display("4: Fixed array: %p", fixed_array);
    end

endmodule

/*
    You can assign dynamic arrays to fixed arrays under the following conditions:
    1- they have the same data type
    2- the dynamic array has the same number of elements as the fixed array ( if less or more, error will be generated)

    You can assign fixed arrays to dynamic arrays under the following conditions:
    1- they have the same data type
*/
