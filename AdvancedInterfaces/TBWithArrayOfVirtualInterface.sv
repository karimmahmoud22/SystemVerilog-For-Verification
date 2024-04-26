/*
    purpose: This file contains example of a TB with array of virtual interfaces
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/


interface X_if (input logic clk);
    logic [7:0] din, dout;
    logic reset_l, load;
    
    clocking cb @(posedge clk);
        output din, load;
        input dout;
    endclocking
    
    always @cb
        $strobe("@%0d:%m: out=%0d, in=%0d, ld=%0d, r=%0d", $time, dout, din, load, reset_l);
    
    modport DUT (input clk, din, reset_l, load, output dout);
    modport TB (clocking cb, output reset_l);

endinterface

module DUT(X_if.DUT xi);
    logic [7:0] count;
    assign xi.dout = count;
    
    always @(posedge xi.clk or negedge xi.reset_l) begin
        if (!xi.reset_l) 
            count = 0;
        else if (xi.load) 
            count = xi.din;
        else 
            count++;
    end
endmodule


parameter NUM_XI = 2; // Number of design instances
module top;

    // Clock generator
    bit clk;
    initial forever #20 clk = ~clk;

    // Instantiate N interfaces
    X_if xi [NUM_XI] (clk); 

    // Instantiate the testbench
    test tb();

    // Generate N DUT instances
    generate
        for (genvar i=0; i<NUM_XI; i++) begin : dut
            DUT d (xi[i]);
        end
    endgenerate
endmodule : top


program automatic test;

    virtual X_if.TB vxi[NUM_XI]; // Virtual ifc array
    Driver driver[];
    initial begin
        // Connect local virtual interface to top
        vxi = top.xi;
        // Create N drivers
        driver = new[NUM_XI];
        
        foreach (driver[i]) begin
            driver[i] = new(vxi[i], i);
            driver[i].reset;
        end
        
        foreach (driver[i])
            driver[i].load;
        
        repeat (10) 
            @(vxi[0].cb);
    end

endprogram