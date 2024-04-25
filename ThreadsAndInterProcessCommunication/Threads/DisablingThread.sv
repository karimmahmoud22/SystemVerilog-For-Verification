/*
    purpose: This file contains example of disabling threads
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

parameter TIME_OUT =1000;

module top;
    
    class Transaction;
        rand bit [7:0] addr;
    endclass

    class Bus;
        Transaction tr;
        bit flag;
        task wait_for_tr ( Transaction tr );
            fork 
                begin
                    fork: timeout_block
                        begin
                            // wait till the address on the bus is changed to the required address
                            wait ( bus.tr.addr != tr.addr );
                            #TIME_OUT $display("@%0d: Error Time out", $time);
                        end
                    join_any: timeout_block
                    disable timeout_block;
                end            
            join_none
        endtask
    endclass

    Bus bus;
    Transaction tr;

    initial begin
        bus = new();
        bus.tr = new();
        tr = new();
        
        // First test case ( address is the same) ==> the timeout block will be disabled
        bus.tr.addr = 8'hFF;
        tr.addr = 8'hFF;
        #10;
        bus.wait_for_tr( tr );

        #20;
        
        // Second test case ( address is not the same) ==> the timeout block will be enabled
        tr.addr = 8'hF1;
        bus.wait_for_tr( tr );

        // show the wave form
        $dumpfile("DisablingThread.vcd");
        $dumpvars();
        $display("Start simulation");
        #10000;
    end
endmodule


/*

Note:
    - in case of the address is the same the timeout block will be disabled otherwise the timeout block will be enabled
    - Here if the transaction is done so the timeout block will be disabled
    - The timeout block will be disabled if the transaction is done or the time out is reached
Output:

*/