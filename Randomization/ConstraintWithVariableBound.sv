/*
    purpose: This file contains example of constraint with variable bound in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constraint_with_variable_bound();
    class Bounds;
        rand int unsigned size;
        int max_size = 100;
        constraint c_size{
            size inside {[1:max_size]};
        }
    endclass

    Bounds b ;

    initial begin
        b = new();
        repeat(10) begin
            b.randomize();
            $display("Size = %0d", b.size);
        end
    end
endmodule

