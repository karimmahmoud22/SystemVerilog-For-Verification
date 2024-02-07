/*
    purpose: This file contains some Array Reduction Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module xor();

    bit [5:0]on [1:10];
    int total;

    // bits are large enough to hold the sum of the array
    initial begin
        foreach (on[i]) begin
            on[i] = i;
            $display("on[%0d] = %b",i,on[i]);
        end        

    // xor will be 11 as it is large enough to hold the xor of the array
    $display( "The sum of the array on is = %0d ",on.xor());
    
    // xor will be 11
    $display( "The sum of the array on is %0d",on.xor() with(int'(item) ) );

    end




/*
    There are more methods such as and, or...etc
*/