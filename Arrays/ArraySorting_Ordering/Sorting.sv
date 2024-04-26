/*
    purpose: This file contains sorting and ordering algorithms for arrays
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module sorting();

    initial begin
        
        int d[] = '{9,1,8,3,4,4};
        $display("Array before sorting: %p", d);

        // reverse the array
        d.reverse();
        $display("Array after reversing: %p", d);

        // sort the array
        d.sort();
        $display("Array after sorting: %p", d);

        // sort the array in descending order
        d.rsort();
        $display("Array after sorting in descending order: %p", d);

        // shuffle the array
        d.shuffle();
        $display("Array after shuffling 1: %p", d);

        // shuffle the array
        d.shuffle();
        $display("Array after shuffling 2: %p", d);

    end
endmodule

