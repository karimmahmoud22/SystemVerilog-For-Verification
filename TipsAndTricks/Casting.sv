/*
    purpose: This file contains casting examples in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module casting();

    // default data type is int 
    typedef enum { red , green , blue , yellow , orange } color_e;
    color_e color1,color2;
    integer i;

    initial begin
        i = 13; // casting from enum to integer
        ++i;
        // check for casting integer to enum if return 1 then casting succeeded
        if( ! $cast(color1 , i ) )
            $display("casting failed");
        else
            $display("casting succeeded");

        // DON'T DO THIS AS IT WILL NOT CHECK FOR OUT OF BOUNDS VALUES
        // casting from integer to enum
        color2 = color_e'(i);
        $display("color2 = %0d",color2);
    end

endmodule

/*
Note:
    1- When i=13 ans use $cast to cast i to color1, the casting will fail as 13 is out of bounds for the enum
    2- When i=13 and use color2 = color_e'(i) the value of color2 will be 0 as 13 is out of bounds for the enum ( any out of bounds value will be casted to the first value in the enum which is 0 in this case)
*/