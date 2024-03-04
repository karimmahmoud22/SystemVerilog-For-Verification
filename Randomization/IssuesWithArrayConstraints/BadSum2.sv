/*
    purpose: This file contains example of bad sum constraint 2
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top_bad_sum_2;
    class bad_sum2;
        rand bit [7:0] len[];
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

    bad_sum2 s;

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
    - Here sum is always positive as bit is unsigned
    - But sum of all transactions is always less than 256 as sum of 8 bit numbers is always 8 bit 
Output:
    size=2, sum= 26 216   66 
    size=2, sum=212 197   15 
    size=5, sum=  6  40  185  178   68   47 
    size=7, sum= 81 134  144  144  135   96   14  182 
    size=2, sum=109  55   54 
    size=2, sum= 63  59    4 
    size=8, sum=179 232  113  209   16   87   21  145  124 
    size=2, sum=156 119   37 
    size=5, sum=242 250  171  158  224  207 
    size=3, sum=254  60  243  207 
*/