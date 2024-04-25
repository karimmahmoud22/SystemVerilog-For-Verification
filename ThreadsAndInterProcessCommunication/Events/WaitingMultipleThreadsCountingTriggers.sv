/*
    purpose: This file contains example of waiting for multiple threads to finish using wait fork
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

# define N_GENERATORS 10

module top;

    event done [N_GENERATORS];

    initial begin
        foreach (gen[i]) begin
            gen[i] = new();
            gen[i].run();
        end

        // wait for all gen to finish by waiting for each event
        foreach (gen[i]) begin
            fork
                automatic int k = i;
                begin
                    wait(done[k].triggered);
                    ++done_count;
                end
            join_none
        end

        wait fork;  //wait for all those triggers to finish
    end

endmodule

/*
Note:

output:
*/