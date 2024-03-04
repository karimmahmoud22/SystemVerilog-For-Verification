/*
    purpose: This file contains example of ethernet switch configuration
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;

    class eth_cfg;
        rand bit [3:0] in_use;              // ports used in test
        rand bit [47:0] mac_addr[4];        // MAC addresses
        rand bit [3:0] is_100;              // 100mb mode
        rand int run_for_n_frames;          // #frames in test

        // Force some addr bits when running in unicast mode
        constraint local_unicast {
            foreach( mac_addr[i] )
                mac_addr[i][41:40] == 2'b00;
        }

        constraint reasonable {         // Linit test length
            run_for_n_frames inside { [1, 100] };
        }
    endclass: eth_cfg

    eth_cfg eth_cfg1, eth_cfg2;

    initial begin   
        eth_cfg1 = new();
        eth_cfg2 = new();

        eth_cfg1.randomize();
        eth_cfg2.randomize();

        $display("eth_cfg1.in_use = %0d", eth_cfg1.in_use);
        $display("eth_cfg1.mac_addr = %0h", eth_cfg1.mac_addr);
        $display("eth_cfg1.is_100 = %0d", eth_cfg1.is_100);
        $display("eth_cfg1.run_for_n_frames = %0d", eth_cfg1.run_for_n_frames);

    end

endmodule
/*
Note:
  

*/