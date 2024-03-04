/*
    purpose: This file contains example of constraints equivalent to randcase
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;    

    class LenDist;
        rand int len;
        constraint len_c { 
            len dist { [0:2]:=1 , [3:5]:=8 , [6:7]:=1 }; 
        }
    endclass

    LenDist len_dist;

    initial begin
        for( int i=0 ; i<10 ; ++i) begin
            len_dist = new();
            assert(len_dist.randomize());
            $display("len = %0d", len_dist.len);
        end
    end

endmodule

/*
Note:
    -randcase is more difficult to override and modify than constraints
    - Be careful when using randcase, it is not as flexible as
Output:
    len = 3
    len = 3
    len = 3
    len = 3
    len = 4
    len = 5
    len = 3
    len = 6
    len = 5
    len = 3

*/