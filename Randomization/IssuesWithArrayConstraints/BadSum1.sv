/*
    purpose: This file contains example of bad sum constraint 1
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top_bad_sum_1;
    class bad_sum1;
        rand byte len[];
        constraint c_len_sum {
            len.sum() < 1024;
            len.size() inside {[1:8]};
        }

        function void display();
            $write("size=%0d, sum=", len.size(), len.sum() );
            foreach(len[i]) begin
                $write("%4d ", len[i]);
            end
            $display;
        endfunction
    endclass    

    bad_sum1 s;

    initial begin
        s = new();
        repeat(10) begin
            assert (s.randomize()) 
            else $fatal("Randomization failed");
            s.display();
        end
    end

endmodule

/*
Note:
    - Here sum is sometimes negative as byte is signed
Output:
    size=2, sum=         26 -40   66 
    size=2, sum=        -44 -59   15 
    size=5, sum=          6  40  -71  -78   68   47 
    size=7, sum=         81-122 -112 -112 -121   96   14  -74 
    size=2, sum=        109  55   54 
    size=2, sum=         63  59    4 
    size=8, sum=        -77 -24  113  -47   16   87   21 -111  124 
    size=2, sum=       -100 119   37 
    size=5, sum=        -14  -6  -85  -98  -32  -49 
    size=3, sum=         -2  60  -13  -49 

*/