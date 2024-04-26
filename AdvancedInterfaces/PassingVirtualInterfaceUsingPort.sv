/*
    purpose: This file contains example of passing virtual interface using port
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/


parameter NUM_XI = 2; // Number of instances
module top;
    // Instantiate N interfaces
    X_if xi [NUM_XI] (clk);

    // Instantiate the testbench
    test tb(xi);
endmodule : top

program automatic test(X_if xi [NUM_XI]);
    Driver driver[];
    virtual X_if vxi[NUM_XI];
    initial begin
        // Connect the local virtual interfaces to the top
        if (NUM_XI <= 0) 
            $finish;
        driver = new[NUM_XI];
        vxi = xi; // Assign the interface array
        
        for (int i=0; i<NUM_XI; i++) begin
            driver[i] = new(vxi[i], i);
            driver[i].reset;
        end
    end
endprogram