/*
    purpose: This file contains Returning From Routine example
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module returning_from_routine();

    task load_array(int length, ref int arr[]);

        // check if length is valid
        if( length <= 0 ) begin
            $display("Error: length should be greater than 0");
            return;
        end


        for(int i=0; i<length; i++) begin
            arr[i] = i*i;
            $display("arr[%0d] = %0d", i, arr[i]);
        end

    endtask

    initial begin
        int arr[];
        arr = new[5];
        load_array(0, arr);
        $display("----------------------");
        load_array(5, arr);
    end

endmodule

/*

output:
    Error: length should be greater than 0
    ----------------------
    arr[0] = 0
    arr[1] = 1
    arr[2] = 4
    arr[3] = 9
    arr[4] = 16

*/