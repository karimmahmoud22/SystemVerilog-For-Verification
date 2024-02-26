/*
    purpose: This file contains example of using solve before in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module probabilities_with_implication();
    class solve_before;
        rand bit x; // 0 or 1   
        rand bit [1:0] y;   // 0, 1, 2, or 3

        constraint c_prob_implication {
            ( x == 0 ) -> ( y == 0) ;
            solve x before y;
        }
    endclass

    solve_before pi;

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
    Here we are using solve before to make sure that x is solved before y
    This will make sure that x is solved before y, and the implication will be satisfied
Probabities:
    x=0, y=0 ==> probability = 1/2
    x=0, y=1 ==> probability = 0
    x=0, y=2 ==> probability = 0
    x=0, y=3 ==> probability = 0
    x=1, y=0 ==> probability = 1/8
    x=1, y=1 ==> probability = 1/8
    x=1, y=2 ==> probability = 1/8
    x=1, y=3 ==> probability = 1/8
*/
