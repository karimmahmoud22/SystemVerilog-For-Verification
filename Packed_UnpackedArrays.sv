/*
    purpose: This file contains exapmle of mixing packed and unpacked arrays
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module packed_unpacked_arrays();

    // It will be a packed array of 4 bytes
    // the size of the array is 3
    /*
    Array of 3 elements, each element is a packed array of 4 bytes
    First element is:   0000_0000 0000_0000 0000_0000 0000_0000 ==> [3:0] [7:0]
    Second element is:  0000_0000 0000_0000 0000_0000 0000_0000 
    Third element is:   0000_0000 0000_0000 0000_0000 0000_0000
    Fourth element is:  0000_0000 0000_0000 0000_0000 0000_0000
    */
    bit [3:0] [7:0] barray [3];         // packed: 3x32-bit
    bit [31:0] lw = 32'h0123_4567;      //word
    bit [7:0] [3:0] nbilles;            // packed array of 8 nibbles

    initial begin
        barray[0] = lw;
        $displayb("barray[0] = ", barray[0]);
        $displayb("barray[0][3] = ", barray[0][3]);
        $displayb("barray[0][3][6] = ", barray[0][3][6]);

        barray[0][3] = 8'hAF;
        barray[0][1][6] = 1'b0;
        nbilles = barray[0];    //copy packed values

        $displayh("nbilles = ", nbilles);
        
    end

endmodule

/* output:
    barray[0] = 00000001001000110100010101100111
    barray[0][3] = 00000001
    barray[0][3][6] = 0
    nbilles = af230567
*/

/* Note:
    The last line of of the shown code copies between two packed arrays. Since the 
    underlying values are just bits, you can copy even if the arrays have different 
    dimensions.
*/


/*Summary:
    1- A packed array is handy if you need to convert to and from scalar values.
    2- You might need to reference a memory as a byte or word.
    3- If you need to wait for a change in an array, you have to use a packed array.
    4- Perhaps your tesebench might need to wake up when a memory changes value, and so you want to use @ operator.
    5- This is however only legal with scalar values and packed arrays. 
*/   