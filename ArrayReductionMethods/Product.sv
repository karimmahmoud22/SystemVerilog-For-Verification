/*
    purpose: This file contains some Array Reduction Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module product();

    bit [5:0]on [1:10];
    int total;

    // bits are large enough to hold the sum of the array
    initial begin
        foreach (on[i]) begin
            on[i] = i;
            $display("on[%0d] = %b",i,on[i]);
        end        

    // product will be 0 as it will take the least significant bit of the product
    $display( "The sum of the array on is = %0d ",on.product());
    
    // product will be 3628800
    $display( "The sum of the array on is %0d",on.product() with(int'(item) ) );

    end

endmodule