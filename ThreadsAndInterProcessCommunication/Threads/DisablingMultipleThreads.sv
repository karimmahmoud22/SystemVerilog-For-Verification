/*
    purpose: This file contains example of automatic variable in fork join
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

module top;

    initial begin
        wait_for_tr(tr0);       // Spawn thread 0

        //Create a thread to limit the scope of disable
        //Thread 1
        fork
            begin
                wait_for_tr(tr1);   // Spawn thread 2
                fork                // Thread 3
                    begin
                        wait_for_tr(tr2);   // Spawn thread 4
                    end
                join

                // stop threads 1 & 2, but leave thread 0 running
                # ( TIME_OUT / 2 ) disable fork;
            end
        join
    end
endmodule


/*

Note:
    - Here disable fork will disable the threads 2 & 3 & 4 as they are below thread 1
    - The thread 0 will continue to run
Output:

*/