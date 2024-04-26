/*
    purpose: This file contains some Array Reduction Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module sum2();

    bit [5:0]on [10];
    int total;

    // bits are large enough to hold the sum of the array
    initial begin
        foreach (on[i]) begin
            on[i] = i;
            $display("on[%0d] = %b",i,on[i]);
        end        

    // sum will be 1 as 
    $display( "The sum of the array on is = %0d ",on.sum());
    
    // sum will be 5 as
    $display( "The sum of the array on is %0d",on.sum() with(int'(item) ) );

    end

endmodule