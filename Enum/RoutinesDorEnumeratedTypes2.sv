/*
    purpose: This file contains routines for enumerated types
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module routines_enumerated_types();

    typedef enum { red , green , blue , yellow , orange } color_e;
    color_e color;

    initial begin
        
        color = yellow;
        $display("1: color = %0d/%0s", color, color.name());

        // Will rotate to the yellow again
        color = color.prev(5);
        $display("2: color = %0d/%0s", color, color.name());

        // Will rotate to the yellow again
        color = color.next(5);
        $display("2: color = %0d/%0s", color, color.name());
        
    end

endmodule

/*
    The functions next and prev wrap around when they reach the beginning or end 
    of the enumeration.

    Note that there is no easy way to write a for-loop that steps through all members 
    of an enumerated type if you use an enumerated loop variable. The problem 
    resides in how to stop the loop
*/