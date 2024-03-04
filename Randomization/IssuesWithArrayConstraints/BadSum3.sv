/*
    purpose: This file contains example of bad sum constraint 3
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top_bad_sum_3;
    class bad_sum3;
        rand int unsigned len[];
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

    bad_sum3 s;

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
    - But sum of all transactions is always 32 bits
    - But Wrap around problem is exist
    - We need to limit the size based on the comparison in the constraint
Output:
    size=2, sum=       1551364553239 2930414212 
    size=2, sum=       9883044620642 1250347642 
    size=5, sum=        34654385177 4142780603 945610593 1059689822 1787468431 
    size=7, sum=       465589874649 1469305314 562867857 98393309 2419999043 3084603486 364891399 
    size=2, sum=        942582195914 1712771476 
    size=2, sum=      10233395547022 899421297 
    size=8, sum=       733   0  352   14    0  367    0    0    0 
    size=2, sum=       7882256263598 2038704486 
    size=5, sum=       5234138179368 2492687367 1418344134 3523449257 1312242285 
    size=3, sum=       3162550333821 670375696 1074258095 
*/