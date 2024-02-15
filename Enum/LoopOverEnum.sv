/*
    purpose: This file contains iterating over an enum
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module iterating_over_enum();

    // starting from 1 not 0
    typedef enum { red , green , blue , yellow , orange } color_e;
    color_e color;

    initial begin
        color = color.first;        
        do 
            begin
            $display("The color is %s", color.name());
            color = color.next;
            end
        while ( color != color.first);
    end

endmodule

/*
    // The following code will make infinite loop:

    color = color.first;        
    do
        $display("The color is %s", color.name());
    while ( color.next() );

*/