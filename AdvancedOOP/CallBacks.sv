/*
    purpose: This file contains example of call backs in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Driver_cbs;

    virtual task pre_tx( Transaction t, ref bit drop );
        // By default call back does no thing
        // Randomly drop 1 out of 100 Transactions
        drop = ( $urandom_range(0, 99) == 0 );
    endtask

    virtual task post_tx( Transaction t );
        // By default call back does no thing
    endtask
endclass

class Driver;

    Driver_cbs cbs [$];

    task run();
        Transaction t;
        bit drop;
        forever begin
            agt2drv.get(t);
            foreach( cbs[i] ) begin
                cbs[i].pre_tx(t, drop);
            end
            if ( !drop ) begin
                send(t);
            end  
            // Transmit the transaction
            foreach( cbs[i] ) begin
                cbs[i].post_tx(t);
            end
        end    
    endtask

endclass