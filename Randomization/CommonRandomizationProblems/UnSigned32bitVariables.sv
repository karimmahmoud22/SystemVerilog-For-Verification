/*
    purpose: This file contains example of problems of unsigned variables
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    class unsigned_variables;
        //logic is unsigned by default
        rand logic [31:0] pkt1_len, pkt2_len;
        constraint total_length {
            pkt1_len + pkt2_len == 64;
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
    - Here only positive values are generated
    - But there is a wrap around problem if the sum of pkt1_len and pkt2_len is greater than 2^32 - 1
Output:     
    pkt1_len = 2948434538, pkt2_len = 1346532822
    pkt1_len = 647720451, pkt2_len = 3647246909
    pkt1_len = 4185266401, pkt2_len = 109700959
    pkt1_len = 1999329244, pkt2_len = 2295638116
    pkt1_len = 726111373, pkt2_len = 3568855987
    pkt1_len = 303203197, pkt2_len = 3991764163
    pkt1_len = 1403225907, pkt2_len = 2891741453
    pkt1_len = 44295297, pkt2_len = 4250672063
    pkt1_len = 2091701360, pkt2_len = 2203266000
    pkt1_len = 2870433970, pkt2_len = 1424533390
*/
