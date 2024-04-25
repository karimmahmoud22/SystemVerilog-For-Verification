/*
    purpose: This file contains example of waiting for multiple threads to finish using thread count
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

#define N_GENERATORS 10

class Generator;

    static int thread_count;
    event done;

    function new (event done);
        this.done = done;
    endfunction

    task run;
        ++thread_count;
        fork 
            begin
                // Do the real work here and when done decrement the thread count
                --thread_count;
            end
        join_none
    endtask

endclass

Generator gen [N_GENERATORS];

program automatic test;

    initial begin
        foreach ( gen[i]) begin
            gen[i] = new();
        end

        foreach ( gen[i]) begin
            gen[i].run();
        end

        // wait for the generators to finish
        wait ( gen[0].thread_count == 0);
    end

endprogram


/*
Note:

output:
*/