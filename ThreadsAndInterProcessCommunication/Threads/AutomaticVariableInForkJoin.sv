/*
    purpose: This file contains example of automatic variable in fork join
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

module top;

    initial begin
        for ( int i=0 ; i<3 ; ++i) begin
            fork
                automatic int j = i;
                $write(j);
            join_none
        end
        #0 $display("Done");
    end
endmodule


/*
Note:
    - The #0 delay blocks the current thread until all forked threads are done
    - Here each thread will print each own copy of k 
Output:
    0          1          2 Done

*/