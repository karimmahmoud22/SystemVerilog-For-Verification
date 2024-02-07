/*
    purpose: This file contains some operations on arrays using for and foreach loops
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module for_foreach();

    // any array decleared in the initial block is a local variable which can not be accessed from outside the block
    initial begin
        bit [31:0] src [5] , des [5];

        for( int i=0; i<$size(src) ; ++i )
            src[i] = i;

        // here j will loop through all the elements of des without defining it
        foreach(des[j])
            des[j] = src[j] + 1;

        // %0d: 0 decimal places to print the number without white spaces
        foreach(src[i])
            $display("src[%0d] = %b = %0d", i, src[i], src[i]);

        foreach(des[j])
            $display("des[%0d] = %b = %0d", j, des[j], des[j]);
    end

    // Another example 
    initial begin 
        // 2D array of 3 rows and 5 columns: each element is 32 bits
        int abc [3][5];

        foreach(abc[i,j])
            abc[i][j] = 10*i + j;

        // loop on each row
        foreach(abc[i]) begin
            $write("Row %0d: ", i);
            // loop on each column of the current row
            foreach(abc[,j])
                $write("%5d ", abc[i][j]);
            // display: will print all the elements in the buffer
            $display;
        end
    end
endmodule
