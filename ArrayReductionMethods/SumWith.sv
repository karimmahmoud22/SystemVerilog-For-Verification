/*
    purpose: This file contains some Array Reduction Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module sum_with();

    int count, total, d [] ='{9,1,8,3,4,4};

    initial begin
        // 1+0+1+0+0+0 = 2 but can not but 2 (10) into a single bit
        count = d.sum() with ( item > 7 ); 
        $display("The number of the elements which are greater than 7 = %0d ",count);
        
        // 1+0+1+0+0+0 = 2 so it will be correct as we cast it to int
        count = d.sum() with (int'( item > 7 )); 
        $display("The number of the elements which are greater than 7 = %0d ",count);

        // To get the sum of numbers which are greater than 7
        total = d.sum() with ( ( item > 7 ) * item);
        $display("The sum of the elements which are greater than 7 = %0d ",total);

        //To count the numbers which are less than 8
        count = d.sum() with (int'( item < 8 ));
        $display("The number of the elements which are less than 8 = %0d ",count);

        // To get the sum of numbers which are less than 8
        total = d.sum() with ( ( item < 8 ) * item);
        $display("The sum of the elements which are less than 8 = %0d ",total);

        // simple if statement
        total = d.sum() with ( item < 8 ? item : 0);
        $display("The sum of the elements which are less than 8 = %0d ",total);

        // To get the numbers which is equal to 4
        count = d.sum() with ( int'( item == 4 ) );
        $display("The number of the elements which are equal to 4 = %0d ",count);

    end

endmodule