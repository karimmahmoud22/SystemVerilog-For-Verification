/*
    purpose: This file contains example of clock generator using module
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/


// GOOD CLOCK GENERATOR
module automatic clk_generator( output bit clk , out_sig );

    clk=0;
    always #5 clk = ~clk;

endmodule