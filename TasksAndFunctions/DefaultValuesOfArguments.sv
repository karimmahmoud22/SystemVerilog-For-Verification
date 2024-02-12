/*
    purpose: This file contains checksum example
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module checksum_slice();

    // arr is constant ==> it is not allowed to change it && if you try to change it, you will get an error
    // arr is passed by reference ( you just sent a pointer to the array to the function )
    function void my_checksum_slice ( const ref bit [31:0] arr[],
                                      input bit [31:0] low = 0,
                                      input int high = -1);

        // separate the declaration from intialization to avoid unexpected behaviours
        bit [31:0] checksum;
        checksum = 0;

        // check the validity of upper bound of the slice
        // if not valid make it till the end of the arrray
        if ( high == -1 || high >= arr.size() -1 )
            high = arr.size()-1;    


        for( int i=low ; i<= high ; ++i ) begin
            checksum ^= arr[i];
        end


        $display("The checksum before complementing is %0d", checksum);

        checksum = ~checksum;

        $display("The checksum after complementing is %0d", checksum);

    endfunction

    initial begin
        // if you specified the size of the array, you will get an error
        // The error: Illegal connection to the ref port 'arr' of function/task 
        // 'my_checksum',formal argument should have same type as actual argument.
        bit [31:0] arr[]= '{21,17,7,50,10};

        $display("The array is: %p", arr);

        my_checksum_slice(arr);
        my_checksum_slice(arr,2,4);
        my_checksum_slice(arr,1);
        my_checksum_slice(arr,,2);
        
    end

endmodule

/*
output:
    The checksum before complementing is 59
    The checksum after complementing is 4294967236
    The checksum before complementing is 63
    The checksum after complementing is 4294967232
    The checksum before complementing is 46
    The checksum after complementing is 4294967249
    The checksum before complementing is 3
    The checksum after complementing is 4294967292
*/