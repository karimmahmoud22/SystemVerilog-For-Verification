/*
    purpose: This file contains example of disabling threads
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

parameter TIME_OUT =1000;

module top;
    
    task wait_for_tr ( Transaction tr );
        fork 
            begin
                fork: timeout_block
                    begin
                        wait ( bus.tr.addr != tr.addr );
                        #TIME_OUT $disblay("@%0d: Error Time out", $time);
                    end
                join_any
                disable timeout_block;

                $display("@%0d: Addr match %0d", $time, tr.addr);
            end            
        join_none
    endtask

    initial begin
    end
endmodule


/*

Note:
    - Here if the transaction is done so the timeout block will be disabled
    - The timeout block will be disabled if the transaction is done or the time out is reached
Output:

*/