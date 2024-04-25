/*
    purpose: This file contains example of blocking on event ( edge - sensitive )
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

module top;

    event e1, e2;
    initial begin

        $display("@%0d: 1: before trigger ", $time);
        -> e1;
        @e2;
        $display("@%0d: 1: after trigger ", $time);
    end

    initial begin
        $display("@%0d: 2: before trigger ", $time);
        -> e2;
        @e1;
        $display("@%0d: 2: after trigger ", $time);
    end


endmodule

/*
Note:
    - The first initial block will trigger e1 and wait for e2
    - The second initial block will trigger e2 and wait for e1
    - But the second thread locks up beacuse it missed the first event e1, which is a zero-width pulse

output: 
    @0: 1: before trigger 
    @0: 2: before trigger 
    @0: 1: after trigger

*/