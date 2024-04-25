/*
    purpose: This file contains example of Generator in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

program automatic test;

    Environment env;

    initial begin
        env = new();
        env.build();
        begin
            BadTr btr;
            btr = new();            // replace the blueprint with the bad transaction
            env.drv.tr = bad;
        end
        env.run();
        env.wrapup();
    end


endprogram