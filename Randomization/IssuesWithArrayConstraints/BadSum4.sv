/*
    purpose: This file contains example of bad sum constraint 4
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top_bad_sum_4;
    class bad_sum4;
        rand bit [9:0] len[];
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

    bad_sum4 s;

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
    - But the len may be greater than 255
    - We need to put constraint on len of each element of the array so the sum is correct
Output:
    size=2, sum= 296 728  592 
    size=2, sum= 776 965  835 
    size=5, sum= 666 296  174   75  189  956 
    size=7, sum= 255 134   36  121  386  526  941  159 
    size=2, sum= 708 567  141 
    size=2, sum= 316  59  257 
    size=8, sum= 654 488   92  269  348  277  804  215  209 
    size=2, sum= 640 375  265 
    size=5, sum= 9021018  938  521  831  666 
    size=3, sum= 292 828 1020  492 
*/