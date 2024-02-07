/*
    purpose: This file contains some Array Locator Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module find_with();

    int d[] = '{9,1,8,3,4,4} , tq[$];

    initial begin
        
        //Find all elements greater than 3
        tq = d.find with(item > 3); // 9,8,4,4
        $display("The elements greater than 3 are: %p", tq);

        //Equivalent to the previous line
        tq.delete;
        foreach (d[i]) begin
            if (d[i] > 3) 
                tq.push_back(d[i]);
        end

        // With Expression
        // find_index(): returns the index of the elements that satisfies the condition
        tq = d.find_index with (item > 3 && item < 9); // 8,4,4
        $display("The elements greater than 3 and less than 9 are: %p", tq);

        // find_first(): returns the first element that satisfies the condition
        tq = d.find_first with (item > 3); // 9 
        $display("The first element greater than 3 is: %p", tq);

        // find_first_index(): returns the index of the first element that satisfies the condition
        tq = d.find_first_index with (item == 8 ); // 2
        $display("The index of the first element equal to 8 is: %p", tq);

        // find_last(): returns the last element that satisfies the condition
        tq = d.find_last with (item == 4); // 4
        $display("The last element equal to 4 is: %p", tq);

        // find_last_index(): returns the index of the last element that satisfies the condition
        tq = d.find_last_index with (item == 4); // 5

    end

endmodule