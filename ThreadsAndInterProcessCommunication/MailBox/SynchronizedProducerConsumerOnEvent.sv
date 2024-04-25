/*
    purpose: This file contains example of synchronized producer consumer using mailbox
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/


program automatic mailbox_example;

    event handshake;
    mailbox mb;

    class Producer;
        task run();
            for ( int i = 1; i < 4; ++i ) begin
                $display("Producing transaction %0d", i);
                mb.put(i);
                @(handshake);
                $display("Producing transaction %0d completed", i);
            end
        endtask
    endclass

    class Consumer;
        task run( );
        int i;
            repeat(3) begin
                mb.get(i);
                $display("Consuming transaction %0d", i);
                ->handshake;
            end
        endtask
    endclass


    Producer p1;
    Consumer c1;

    initial begin
        mb = new();
        p1 = new();
        c1 = new();
        
        fork
            p1.run();
            c1.run();
        join_none
    end
  
endprogram


/*
Note:

output:
    Producing transaction 1
    Consuming transaction 1
    Producing transaction 1 completed

    Producing transaction 2
    Consuming transaction 2
    Producing transaction 2 completed
    
    Producing transaction 3
    Consuming transaction 3
    Producing transaction 3 completed

*/