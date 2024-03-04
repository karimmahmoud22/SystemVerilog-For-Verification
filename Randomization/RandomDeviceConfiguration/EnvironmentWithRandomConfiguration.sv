/*
    purpose: This file contains example of building a random environment
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;

    class Environment;
        eth_cfg cfg;
        eth_src gen[4];
        eth_mii drv[4];

        function new();
            cfg = new();            
        endfunction

        function void gen_cfg();
            assert( cfg.randomize() );
        endfunction

        //Use random configuration to build the environment
        function void build();
            foreach( src[i] )
                if( cfg.in_use[i] ) begin
                    gen[i] = new();
                    drv[i] = new();
                    if( cfg.is_100[i] )
                        mii[i].set_speed(100);
                end
        endfunction

        task run;
            // Start the testbench transcators
        endtask 

        task wrapup;
            // Close the testbench transcators
        endtask

    endclass: Environment

endmodule
/*
Note:
  
Output:
*/