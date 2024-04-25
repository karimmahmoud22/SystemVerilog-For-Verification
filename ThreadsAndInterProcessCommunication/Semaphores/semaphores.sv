/*
    purpose: This file contains example of using semaphores
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

program automatic test;

    semaphore sem;
    initial begin
        sem = new(1);           // Allocate a semaphore with 1 resource
        fork
            sequencer;
            sequencer;
        join_none
    end

    task sequencer;
        repeat ( $urandom() % 10 )  // random wait , 0-9 cycles
            @bus.cb;
        sendTrans;
    endtask

    task sendTrans;
        sem.get(1);     //Get the key to the bus
        @bus.cb;        // Drive the signals into the bus
        bus.cb.addr <= t.addr;
        //Do work
        sem.put(1);
    endtask
  
endprogram


/*
Note:

output:
*/