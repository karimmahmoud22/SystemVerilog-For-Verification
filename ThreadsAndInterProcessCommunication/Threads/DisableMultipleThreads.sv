/*
    purpose: This file contains example of automatic variable in fork join
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

module top;
    
    wait_for_tr(tr0);

    fork : threads_1_2
        wait_for_tr(tr1);
        wait_for_tr(tr2);
    join_any

    # ( TIME_OUT / 2 ) disable threads_1_2

endmodule

/*
Note:
    - The threads_1_2 will be disabled after TIME_OUT / 2
    - if one of the 2 transactions tr1 or tr2 is completed, the other transaction will be disabled
*/