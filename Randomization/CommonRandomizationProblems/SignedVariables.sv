/*
    purpose: This file contains example of problems of signed variables
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    class signed_variables;
        rand byte pkt1_len, pkt2_len;
        constraint total_length {
            pkt1_len + pkt2_len == 64;
        }
    endclass

    signed_variables s;

    initial begin
        s = new();
        repeat(10) begin
            assert (s.randomize()) 
            else $fatal("Randomization failed");
            $display("pkt1_len = %0d, pkt2_len = %0d", s.pkt1_len, s.pkt2_len);
        end
    end
endmodule

/*
Note:
    - Here one of possible values of pkt1_len and pkt2_len is negative such as pkt1_len = -1, pkt2_len = 65
    - Take care if you don't want to have negative values

Output: 
    pkt1_len = 55, pkt2_len = 9
    pkt1_len = 78, pkt2_len = -14
    pkt1_len = 9, pkt2_len = 55
    pkt1_len = 102, pkt2_len = -38
    pkt1_len = 51, pkt2_len = 13
    pkt1_len = 87, pkt2_len = -23
    pkt1_len = 41, pkt2_len = 23
    pkt1_len = 26, pkt2_len = 38
    pkt1_len = 102, pkt2_len = -38
    pkt1_len = -9, pkt2_len = 73
*/
