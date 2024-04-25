/*
    purpose: This file contains expression width examples
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module expression_width;

    bit [7:0] b8;
    bit one = 1'b1;

    initial begin

        // bit +bit = bit ==> asnwer = 0 as result = 10 and it takes the least bit
        $display("1: ", one + one);

        // the largest width dominates so answer will be 2'b00
        $display("2: ", one + one + 2'b00);

        // casting the result to int (32 bits)
        $display("3: ", int'(one + one ));

        // answer will be 8 bits
        b8 = one + one;
        $display("4: ", b8);

    end
endmodule