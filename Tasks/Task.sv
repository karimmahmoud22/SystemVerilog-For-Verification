/*
    purpose: This file contains some tasks examples
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module strings();

    initial begin
        #10;
        my_log("End of the simulation");
        #20
        my_log("End of the simulation");
    end

    // Task
    task my_log ( string msg);
        $display("@%0t: ", $time, " ==> %0s", msg);
    endtask


endmodule
