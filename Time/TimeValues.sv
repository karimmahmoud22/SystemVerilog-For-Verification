/*
    purpose: This file contains Time Values example
    Author: Karim Mahmoud Kamal
    Date:    12th of February 2024
*/

module time_values();

    timeunit 1ns;
    timeprecision 1ps;  // 1/1000 of timeunit ==> you can write 3 digits after the decimal point

    initial begin
        // -9 ==> means ns
        // 3 ==> 3 digits after the decimal point
        // "ns" ==> you can write any string
        // 10 ==> the minimum number of places to print the number 
        $timeformat(-9, 3, "ns", 10);

        #1 $display("%t", $realtime);  //1.000ns
        #2ns $display("%t", $realtime);  //3.000ns
        #0.1ns $display("%t", $realtime);  //3.100ns
        #41ps $display("%t", $realtime);  //3.141ns
    end

endmodule

/*
• The four arguments of $timeformat are:
    1. The scaling factor (-9 for nanoseconds, -12 for picoseconds .. etc),
    2. The number of digits to the right of the decimal point,
    3. A string to print after the time value,
    4. The minimum field width.
*/

/*
output:
    1.000ns
    3.000ns
    3.100ns
    3.141ns
*/