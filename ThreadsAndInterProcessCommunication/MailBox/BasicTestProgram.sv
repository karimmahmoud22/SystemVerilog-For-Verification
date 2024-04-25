/*
    purpose: This file contains example of environment using mailbox
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

program automatic test;

    Environment env;

    initial begin
        env = new();
        env.gen_cfg();
        env.build();
        env.run();
        env.wrapup();
    end
    

endprogram