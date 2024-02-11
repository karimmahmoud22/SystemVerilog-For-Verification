/*
    purpose: This file contains routines for enumerated types
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module routines_enumerated_types();

    typedef enum { red , green , blue , yellow , orange } color_e;
    color_e color;

    initial begin
        
        color = color.first();
        $display("1: color = %0d/%0s", color, color.name());
        
        color = color.next();
        $display("2: color = %0d/%0s", color, color.name());
        
        color = color.prev();
        $display("3: color = %0d/%0s", color, color.name());

        color = color.last();
        $display("4: color = %0d/%0s", color, color.name());

        color = color.prev(2);
        $display("5: color = %0d/%0s", color, color.name());

        color = color.next(2);
        $display("6: color = %0d/%0s", color, color.name());
        
    end

endmodule

/*

Output:
    1: color = 0/red
    2: color = 1/green
    3: color = 0/red
    4: color = 4/orange
    5: color = 2/blue
    6: color = 4/orange

*/


/*
The following one will produce an error

    typedef enum { red , green=3 , blue=1 , yellow , orange } color_e;
        color_e color;

    The error is:
        The enum label 'orange' has the value 3 which is duplicate of enum label 
        'green' in the enum 'color_e'.
    
    As the enum values are not in sequence
    enum store the values in increasing order so after blue=1, yellow will be 2 and orange will be 3
    So, the value of green=3 is not valid

    but 
    typedef enum { red , green=3 , blue=1 , yellow } color_e;
        color_e color;
    No error as after blue=1, yellow will be 2 and we will not reach 3

*/