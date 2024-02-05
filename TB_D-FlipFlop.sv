/*
    Purpose: This file contains the code for a testbench for the D-FlipFlop module
    Author:  Karim Mahmoud Kamal
    Date:    5th of February 2024
*/

// d, clk, and rst are inputs to the D-FlipFlop module.
// No checker is needed for the D-FlipFlop module in this case.
module tb_dff( d , clk , rst_l , q , qbar );

    // The period of the clock signal 
    parameter CYCLE_PERIOD = 10;

    // Inputs
    input q , qbar ;

    // outputs
    output d, clk, rst_l;

    // Wires
    wire q , qbar ;

    // regiseters
    reg d, clk, rst_l;

    /*
    Note: if there are more than 1 initial block in a module
          then they are executed in parallel and indendently
    */

    // The clock signal
    always begin
        #CYCLE_PERIOD clk = ~clk;
    end

    initial begin
        clk = 1'b0;
        d = 1'b1;
        rst_l = 1'b1;
        #15 rst_l = 1'b0;
        #8 rst_l = 1'b1;
        #6 d = 1'b0;
        #30 d = 1'b1;
        #2 d = 1'b0;
        #6 d = 1'b1;
    end

    // instantiation of the D-FlipFlop module ( same as creating an object of a class in C++)
    dff dff_inst( .d(d), .clk(clk), .q(q), .qbar(qbar), .rst_l(rst_l) );

    // The following code is wriiten in any design to show the waveform of the D-FlipFlop module
    initial begin
        // Dump the waveforms ==> to save the waveforms in a file
      	$dumpfile("waves.vcd");
        // Dump the variables ==> to put the variables in the file
        $dumpvars;
        // Run the simulation for 100 time units
        #200 $finish;
    end
endmodule
