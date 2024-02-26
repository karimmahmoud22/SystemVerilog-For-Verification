/*
    purpose: This file contains example of bathub distribution in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module bathub_distribution();
    class bathub;
        int value;  // Random variable with bathtub distribution
        int WIDTH = 50, DEPTH = 4, seed = 1;

        function void pre_randomize();
            //calculate the left curve of the bathtub
            value = $dist_exponential(seed, DEPTH);
            if (  value > WIDTH ) begin
                value = WIDTH;
            end

            //Randmoly put this point on the left or right side of the bathtub
            if ( $urandom_range(1) ) begin
                value = WIDTH - value;
            end
        endfunction
    endclass

    bathub b = new();

    initial begin
        b.pre_randomize();
        $display("Value = %0d", b.value);
    end
endmodule

