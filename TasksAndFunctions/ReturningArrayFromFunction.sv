/*
    purpose: This file contains Returning Array From Function example
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module returing_array_from_function();

    typedef int int_array_t [5];
    int_array_t arr;

    // The first method:
    // load_array is the name of function and name od the array
    function int_array_t load_array1(int start);
        foreach( load_array1[i] )
            load_array1[i] = i + start;
    endfunction


    //The second method:
    function void load_array2(ref int arr[5], input int start);
        foreach( arr[i] )
            arr[i] = i + start;
    endfunction

    initial begin

        int result[5];

        // 2 memory locations are allocated for arr
        // 1 for the array itself and 1 for the return value
        arr = load_array1(5);
        foreach( arr[i] )
            $display("first method: arr[%0d] = %0d", i, arr[i]);

        // 1 memory location is allocated for result
        // pass by reference is most efficient in terms of memory
        load_array2(result, 5);
        foreach( result[i] )
            $display("second method: arr[%0d] = %0d", i, result[i]);

    end

endmodule

/*

output:
    first method: arr[0] = 5
    first method: arr[1] = 6
    first method: arr[2] = 7
    first method: arr[3] = 8
    first method: arr[4] = 9
    second method: arr[0] = 5
    second method: arr[1] = 6
    second method: arr[2] = 7
    second method: arr[3] = 8
    second method: arr[4] = 9

*/