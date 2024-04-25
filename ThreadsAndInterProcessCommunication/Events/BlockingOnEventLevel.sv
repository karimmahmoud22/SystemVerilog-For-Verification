/*
    purpose: This file contains example of blocking on event ( level - sensitive )
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

module top;

    event e1, e2;
    initial begin

        $display("@%0d: 1: before trigger ", $time);
        -> e1;
        wait(e2.triggered);
        $display("@%0d: 1: after trigger ", $time);
    end

    initial begin
        $display("@%0d: 2: before trigger ", $time);
        -> e2;
        wait(e1.triggered);
        $display("@%0d: 2: after trigger ", $time);
    end


endmodule

/*
Note:
    - The first initial block will trigger e1 and wait for e2
    - The second initial block will trigger e2 and wait for e1
    - The first event e1 will not be missed as it is not a zero-width pulse and the second thread will not lock up

output:
    @0: 1: before trigger 
    @0: 2: before trigger 
    @0: 2: after trigger 
    @0: 1: after trigger
*/