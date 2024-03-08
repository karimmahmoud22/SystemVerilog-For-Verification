/*
    purpose: This file contains example of bad fork join
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

module top;

    initial begin
        for ( int i=0 ; i<3 ; ++i) begin
            fork
                $write(i);                  //Bug ==> gets fincal value of index
            join_none
        end
        #0 $display("Done");
    end
endmodule


/*
Note:
    - The #0 delay blocks the current thread until all forked threads are done
    - Here each thread will print only the final value of i
Output:
    3          3          3 Done

*/