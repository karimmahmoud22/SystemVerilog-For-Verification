/*
    purpose: This file contains example of simple pseudo random generator
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;    

    reg [31:0] state = 32'h12345678;

    function reg [31:0] my_random;
        reg [63:0] s64;
        s64 = state * state;
        state = ( s64 << 16 ) + state;
        my_random = state;
    endfunction

    initial begin
        for( int i=0 ; i<10 ; ++i) begin
            $display("my_random = %0d", my_random());
        end
    end

endmodule

/*
Note:
    - This is how random function can be implemented
    - So now you can impelenet your own random function

Output:
    my_random = 3933492856
    my_random = 3266598520
    my_random = 2599704184
    my_random = 1932809848
    my_random = 1265915512
    my_random = 599021176
    my_random = 4227094136
    my_random = 3560199800
    my_random = 2893305464
    my_random = 2226411128 

*/