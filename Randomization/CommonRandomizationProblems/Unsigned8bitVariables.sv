/*
    purpose: This file contains example of problems of unsigned variables
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    class unsigned_variables;
        //logic is unsigned by default
        rand logic [7:0] pkt1_len, pkt2_len;
        constraint total_length {
            pkt1_len + pkt2_len == 8'd64;
        }
    endclass

    unsigned_variables s;

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
    - Still there is a wrap around problem if the sum of pkt1_len and pkt2_len is greater than 2^8 - 1
Output:     
    pkt1_len = 201, pkt2_len = 119
    pkt1_len = 78, pkt2_len = 242
    pkt1_len = 233, pkt2_len = 87
    pkt1_len = 102, pkt2_len = 218
    pkt1_len = 51, pkt2_len = 13
    pkt1_len = 87, pkt2_len = 233
    pkt1_len = 41, pkt2_len = 23
    pkt1_len = 26, pkt2_len = 38
    pkt1_len = 102, pkt2_len = 218
    pkt1_len = 201, pkt2_len = 119
*/
