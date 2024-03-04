/*
    purpose: This file contains example of simple test using random configurations
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

program automatic test;

    Environment env;

    initial begin
        env = new();            // Construct the environment
        env.gen_cfg();          // Generate random configuration
        env.build();            // Build the testbench environment
        env.run();              // Run the test
        env.wrapup();           // Clean up after the test & report
    end 

endprogram
/*
Note:
  
Output:
*/