/*
    purpose: This file contains some Array Reduction Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module sum1();

    bit on [10];
    int total;

    /*
        Here on is array of 10 elements, each one is 1 bit wide
        0 :0
        1 :1
        2 :0
        3 :1
        4 :0
        5 :1
        6 :0
        7 :1
        8 :0
        9 :1
        The sum of the array on is 5
        and so on as it will take only the least significant bit
    */

    initial begin
        foreach (on[i]) begin
            on[i] = i;
            $display("on[%0d] = %0d",i,on[i]);
        end        

    // sum will be 1 as 
    $display( "The sum of the array on is = %0d ",on.sum());
    
    // sum will be 5 as
    $display( "The sum of the array on is %0d",on.sum() with(int'(item) ) );

    end

endmodule