/*
    purpose: This file contains checksum example
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module checksum();

    // arr is constant ==> it is not allowed to change it && if you try to change it, you will get an error
    // arr is passed by reference ( you just sent a pointer to the array to the function )
    function void my_checksum ( const ref bit [31:0] arr[]);
        bit [31:0] checksum = 0;
        foreach (arr[i]) begin
            checksum ^= arr[i];
        end
        checksum = ~checksum;
      $display("The checksum is %0d", checksum);
    endfunction

    initial begin
        // if you specified the size of the array, you will get an error
        // The error: Illegal connection to the ref port 'arr' of function/task 
        // 'my_checksum',formal argument should have same type as actual argument.
        bit [31:0] arr[]= '{21,17,7};

        $display("The array is: %p", arr);

        my_checksum(arr);
    end

endmodule

/*
output:
    before 1st complement : 3
    The checksum is 4294967292
*/

/*
Note:
    You can pass an array into a routine. System Verilog allows you to pass 
    array arguments without the ref direction, but the array is copied onto the 
    stack, which is an expensive operation.

    The second benefit of ref arguments is that a task can modify a variable 
    and is instantly seen by the calling function.
*/