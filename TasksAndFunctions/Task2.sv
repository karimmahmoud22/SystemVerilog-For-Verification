/*
    purpose: This file contains some tasks examples
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module Task2();

    // Task
    task my_log ( );
        $display("Hello from my_log task");
        $display("Hello from my_log task");
    endtask

    initial begin
        my_log();
    end

endmodule
