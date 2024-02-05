/*
    Purpose: This file contains the code for a D-FlipFlop module with a synchronous reset
    Author:  Karim Mahmoud Kamal
    Date:    5th of February 2024
*/

// This version is for the D-FlipFlop module with an asynchronous reset
module dff ( d , clk , q , qbar , rst_l );
    
    // Inputs and outputs    
    input d , clk , rst_l ;
    output q , qbar ;

    // Wires
    wire d , clk , rst_l;

    // Registers    
    reg q , qbar ;

    always @ ( rst_l ) begin
        // rst is an asynchronous reset ==> the effect of the reset is seen immediately.
        if ( rst_l == 1'b0 ) begin
            q = 1'b0 ;
            qbar = ~q ;
        end
    end

    always @ ( posedge clk ) begin
        if ( rst_l != 1'b0 ) begin
            q = d;
        end
        qbar = ~q;
    end

endmodule


/*
// This version is for the D-FlipFlop module with a synchronous reset

module dff ( d , clk , q , qbar , rst_l );
    
    // Inputs and outputs    
    input d , clk , rst_l ;
    output q , qbar ;

    // Wires
    wire d , clk , rst_l;

    // Registers    
    reg q , qbar ;

    always @ ( posedge clk ) begin
        // rst is a synchronous reset ==> the effect of the reset is seen at the next positive edge of the clock, otherwise the reset has no effect
        if ( rst_l == 1'b0 ) begin
            q = 1'b0 ;
        end
        else begin
            q = d ;
        end
      qbar = ~q;
    end

endmodule

*/