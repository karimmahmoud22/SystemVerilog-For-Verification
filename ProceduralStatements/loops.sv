/*
    purpose: This file contains procedural statements and loops examples
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module procedural_statements();

    initial 
    begin: example1
        int arr [10], sum, j;
        sum = 0;

        for (int i = 0; i < 10; i++) begin
            arr[i] = i;
            sum += arr[i];
        end
        $display("Sum of array elements is %d", sum);


        j=9;
        sum = 0;
        do begin
            sum += arr[j];
        end while (j--);
        
        //%4d specify the width of the number to be displayed
        $display("Sum of array elements is %4d", sum);

    end: example1
  
endmodule
