/*
    purpose: This file contains example of weighted distribution
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module weighted_distribution();

    class weighted_distribution;
        rand int src, dst;
        constraint c_dist {
            src dist { 0:= 40 , [1:3] := 60 };
            // src = 0 , weight = 40 / ( 40 +  3 * 60 ) = 40 / 220 = 0.1818
            // src = 1 , weight = 60 / ( 40 +  3 * 60 ) = 60 / 220 = 0.2727
            // src = 2 , weight = 60 / ( 40 +  3 * 60 ) = 60 / 220 = 0.2727
            // src = 3 , weight = 60 / ( 40 +  3 * 60 ) = 60 / 220 = 0.2727

            dst dist { 0:/ 40 , [1:3] :/ 60 };
            // dst = 0 , weight = 40 / ( 40 + 60 ) = 40 / 100 = 0.4
            // dst = 1 , weight = ( 60 / 3 )  / ( 40 + 60 ) = 20 / 100 = 0.2
            // dst = 2 , weight = ( 60 / 3 )  / ( 40 + 60 ) = 20 / 100 = 0.2
            // dst = 3 , weight = ( 60 / 3 )  / ( 40 + 60 ) = 20 / 100 = 0.2
        }
    endclass

    weighted_distribution wd;

    initial begin
        wd = new();
        repeat( 10 ) begin
            assert( wd.randomize() );
            $display("src = %0d, dst = %0d", wd.src, wd.dst);
        end
    end
endmodule

/*
Notes: 
    1- := the weight is the same for each value in the spedified range
    2- :/ the weight is divided between values in the spedified range

*/