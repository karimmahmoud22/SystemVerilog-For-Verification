/*
    purpose: This file contains static variable example
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

class BusTran;

    static int count;

    task initialize(int val);
        count = val;
    endtask: initialize

endclass: BusTran

module first_class();
    initial begin
        BusTran b1;
        b1.initialize(42);
    end
endmodule: first_class

/*
    It is legal and run without errors as the static variable is initialized in a task

    ==> The task only uses static variables that are not created in the constructor
*/