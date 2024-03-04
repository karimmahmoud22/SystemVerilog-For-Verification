/*
    purpose: This file contains example of bidirectional constraints
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module bidirectional_constraints();
    class bidir_constraints;
        randc logic [15:0] b, c, d;
        constraint c_didir {
            b < d;
            c == b;
            d < 30;
            c > 25;
        }
    endclass

    bidir_constraints bc;

    initial begin
        bc = new();
        repeat( 10 ) begin
            assert( bc.randomize() );
            $display("b = %0d, c = %0d, d = %0d", bc.b, bc.c, bc.d);
        end
    end
endmodule

/*
Note:
    Even though there is no direct constraint between c and d, the constraint c == b, and d < 30, and c > 25, will indirectly affect the distribution of c and d.

    The following is the only possible values for b, c, and d:
    b = 28, c = 28, d = 29
    b = 26, c = 26, d = 28
    b = 27, c = 27, d = 29

    b = 26, c = 26, d = 29
    b = 27, c = 27, d = 28
    b = 28, c = 28, d = 29
    b = 28, c = 28, d = 29
    b = 27, c = 27, d = 28
    b = 26, c = 26, d = 27
    b = 28, c = 28, d = 29
*/