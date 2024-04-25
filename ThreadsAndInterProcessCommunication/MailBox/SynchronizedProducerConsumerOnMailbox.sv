/*
    purpose: This file contains example of synchronized producer consumer using mailbox
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/


program automatic mailbox_example;

    mailbox mbx, rtn;

    class Producer;
        task run();
            int k;
            for ( int i = 1; i < 4; ++i ) begin
                $display("Producing transaction %0d", i);
                mbx.put(i);
                $display("Producing transaction %0d completed", i);
                rtn.get(k);
                $display("Producer after get %0d", k);
            end
        endtask
    endclass

    class Consumer;
        task run( );
        int i;
            repeat(3) begin
                mbx.get(i);
                $display("Consuming transaction %0d", i);
                rtn.put(-i);
            end
        endtask
    endclass


    Producer p1;
    Consumer c1;

    initial begin
        mbx = new();
        rtn = new();
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
    - The code does not work correctly, it will not produce the expected output
output:
    Producing transaction 1
    Producing transaction 1 completed
    Consuming transaction 1
    Producer after get -1
    Producing transaction 2
    Producing transaction 2 completed
    Consuming transaction 2
    Producer after get -2
    Producing transaction 3
    Producing transaction 3 completed
    Consuming transaction 3
    Producer after get -3

*/