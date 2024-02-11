/*
    purpose: This file contains enumerated types examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module enumerated_types();

    typedef enum { init, decode, idle } finite_state_machine_e;

    finite_state_machine_e present , next;

    initial begin
        // will print 0 as they are stored as integers 0, 1, 2
        $display(present);

        // will print init as it is the first element in the enum
        $display(present.name);

        $display("Next state is %s", next.name());

        // we make present = idle to test the commented state in case statement
        // next state after case statement will be same as before entering the case statement
        // ==> So we need default state
        present = idle;

        case(present)
            init: begin
                $display("init state");
                next = decode;
            end
            decode: begin
                $display("decode state");
                next = idle;
            end
            /*
            idle: begin
                $display("idle state");
                next = init;
            end
            */
            default: begin
                $display("Pressent value state is not found ");
            end
        endcase
        $display("Next state is %s", next.name());
    end

endmodule
