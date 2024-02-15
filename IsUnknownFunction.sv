/*
    purpose: This file contains is unknown function
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module is_unknown_function ();

    // default value is x
    reg [7:0] a;

    // default value is z
    wire [7:0] b;

    initial begin
        $display("1: a = %b", a);
        $display("2: b = %b", b);

        // isunknown function returns 1 if the value is x or z
        if ( $isunknown(a) )
            $display("3: @%0d: 4-state value detected %0d", $time, a);

        if ( $isunknown(b) )
            $display("4: @%0d: 4-state value detected %0d", $time, b);

        // assign a value to a
        a = 8'b10101010;
        if ( $isunknown(a) )
            $display("3: @%0d: 4-state value detected %0d", $time, a);
        else 
            $display("5: a = %b", a);
    end
endmodule