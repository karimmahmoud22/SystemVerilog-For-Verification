/*
    purpose: This file contains example of using implication and bidirectional constraints in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module probabilities_with_implication();
    class prob_implication;
        rand bit x; // 0 or 1   
        rand bit [1:0] y;   // 0, 1, 2, or 3

        constraint c_prob_implication {
            y > 0;
            ( x == 0 ) -> ( y == 0) ;
        }
    endclass

    prob_implication pi;

    initial begin
        pi = new();
        repeat( 10 ) begin
            assert( pi.randomize() );
            $display("x = %0d, y = %0d", pi.x, pi.y);
        end
    end
endmodule

/*
Note: 
    - Implication is bi-directional, so if x is 0, then y must be 0, and if y is 0, then no condition on x
    - But if y not 0, then x must be 1

    x will never be 1 in this case.
*/
