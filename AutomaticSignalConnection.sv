/*
    purpose: This file contains example of automatic signal connection
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/

module top;
    bit clk;
    always #20 clk = ~clk;

    arb_if i1 (.*);
endmodule

// .* ==> for automatic connection ==> if they have the same name and same data types