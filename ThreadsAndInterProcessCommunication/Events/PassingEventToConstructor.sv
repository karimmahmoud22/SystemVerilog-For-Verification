/*
    purpose: This file contains example of passing event to constructor
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Generator;

    event done;
    function new (event done);
        this.done = done;
    endfunction

    task run;
        fork 
            begin
                #10;
                -> done;
            end
        join_none
    endtask

endclass

program automatic test;

    event gen_done;
    Generator gen;

    initial begin
        gen = new(gen_done);
        gen.run();
        wait(gen_done.triggered);
        $display("done");
    end
endprogram


/*
Note:

output:
*/