/*
    purpose: This file contains exapmle of packed arrays
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module packed_arrays();

    //packed array: The dimension is specified before the variable name
    bit [3:0] [7:0] bytes;
    initial begin
        //byte[3]=CA
        //byte[2]=FE
        //byte[1]=DA
        //byte[0]=DA
        bytes = 32'hCafe_Dada;
      $displayh(bytes,, bytes[3],, bytes[3][7]);
    end

endmodule

/* output:
    Cafe_Dada
    CA
    1
*/

/* Notes:
    1- The packed bit and array dimensions are specified as part of the type, before the  variable name.
    2- These dimensions must be specified in the [msb:lsb] format, not [size]
    3- The code above shows the variable bytes, a packed array of four bytes that are 
       stored in a single 32-bit word as shown.
*/