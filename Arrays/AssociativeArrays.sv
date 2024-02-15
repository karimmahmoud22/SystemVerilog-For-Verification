/*
    purpose: This file contains some examples of associative arrays
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module associative_arrays();

    initial begin

        // int is the data type of the content that we use to search for an element 
        // Note: You can use * instead of int ( * refers to any data type)
        int assoc [int];

        int idx=1;

        // repeat is same as for loop
        repeat (20) begin
            assoc[idx] = idx;
            // shift left by 2 is equivalent to multiplying by 2 
            idx = idx << 1;
        end

        foreach (assoc[i]) begin
            $display("assoc[%0d] = %0d", i , assoc[i]);            
        end
        
        /*
        idx = 1;
        do
            $display("%0d: assoc[%0d] = %0d", idx, idx , assoc[idx]);           
        // next is used to increment the index ( get the next one ) 
        while(assoc.next(idx));
        */

        assoc.first(idx);
        assoc.delete(idx);
        $display(assoc);
        
        assoc.first(idx);
        assoc.delete(idx);
        $display(assoc);

    end

endmodule