/*
    purpose: This file contains some Array Locator Methods
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module min_max_unique();

    int f[6] = '{1,6,2,6,6,6};
    int d[] = '{2,4,6,8,10};
    int q[$] = {9,3,5,7};
    int tq[$];

    initial begin

        // To get the minimum value in the queue
        tq = q.min;
        $display("The minimum value in the queue is %p", tq);

        // To get the maximum value in the queue
        tq = q.max;
        $display("The maximum value in the queue is %p", tq);

        // To get the unique values in the queue
        tq = q.unique;
        $display("The unique values in the queue are %p", tq);
        
    end

endmodule

/*
    Note:
        The return value of the min, max and unique methods is a queue.
        So the LHS should be a queue.
*/