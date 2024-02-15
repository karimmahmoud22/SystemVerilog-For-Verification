/*
    purpose: This file contains routines for enumerated types
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module routines_enumerated_types();

    // starting from 1 not 0
    typedef enum { red=1 , green , blue , yellow , orange } color_e;
    color_e color;

    initial begin
        
        $display("The first color is %s", color.name());
        
    end

endmodule

/*
Note:
    It will run without any errors and the output will be empty ( print nothing )
*/