/*
    purpose: This file contains example of probabilities with implication
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module probabilities_with_implication();
    class prob_implication;
        rand bit x; // 0 or 1   
        rand bit [1:0] y;   // 0, 1, 2, or 3

        constraint c_prob_implication {
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
Probabities:
    x = 0, y = 0 ==> probability = 1/2
    x = 0, y = 1 ==> probability = 0
    x = 0, y = 2 ==> probability = 0
    x = 0, y = 3 ==> probability = 0
    x = 1, y = 0 ==> probability = 1/8
    x = 1, y = 1 ==> probability = 1/8
    x = 1, y = 2 ==> probability = 1/8
    x = 1, y = 3 ==> probability = 1/8 
*/