/*
    purpose: This file contains copy from arrays to queues examples
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module fixed_dynamic_array_assignments();

    // Fixed array
    int fixed_array [4];

    // Dynamic array
    int dynamic_array [];

    // Queue
    int queue [$];

    //copy from arrays to queues
    initial begin

        // Assigning a fixed array to a queue
        fixed_array = '{1, 2, 3, 4};
        $display("1: Fixed array: %p", fixed_array);

        queue = fixed_array;
        $display("2: Queue: %p", queue);

        // Assigning a dynamic array to a queue
        dynamic_array = '{5, 6, 7, 8};
        $display("3: Dynamic array: %p", dynamic_array);

        queue = dynamic_array;
        $display("4: Queue: %p", queue);
    end

    // copy from queues to arrays
    initial begin

        // Assigning a queue to a fixed array ( must have the same number of elements)
        queue = '{1, 2, 3, 4};
        $display("1: Queue: %p", queue);

        fixed_array = queue;
        $display("2: Fixed array: %p", fixed_array);

        // Assigning a queue to a dynamic array
        queue = '{5, 6, 7, 8};
        $display("3: Queue: %p", queue);

        dynamic_array = queue;
        $display("4: Dynamic array: %p", dynamic_array);
    end


endmodule

