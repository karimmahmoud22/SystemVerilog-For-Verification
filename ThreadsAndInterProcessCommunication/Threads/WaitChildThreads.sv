/*
    purpose: This file contains example of automatic variable in fork join
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

module top;

    task run_threads;    
        wait_for_tr(tr1);
        wait_for_tr(tr2);
        wait_for_tr(tr2);
    

        wait fork;

    endtask

endmodule

/*
Note:
    - wait fork; will wait till above threads are completed
*/