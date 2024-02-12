/*
    purpose: This file contains Time Variables example
    Author: Karim Mahmoud Kamal
    Date:    12th of February 2024
*/

`timescale 1ps/1ps
module time_variables();

    initial begin
        real rdelay = 800fs;    // stored as 0.8
        time tdelay = 800fs;    // rounded to 1

        $timeformat(-15, 0, "fs", 5);
        $display("rdelay = %t", rdelay);    // prints the exact value
        $display("tdelay = %t", tdelay);    // prints the rounded value

        // the precision of the time variable is 1ps, so all delays are rounded to the nearest picosecond
        #rdelay;
        $display("--%t", $realtime);
        #tdelay;
        $display("--%t", $realtime);
    end

endmodule

/*
output:
    rdelay = 800fs
    tdelay = 1000fs
    --1000fs
    --2000fs

*/