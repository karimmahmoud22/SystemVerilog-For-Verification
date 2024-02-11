/*
    purpose: This file contains streaming operators examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/


module streaming_operators();

    typedef bit [7:0] array_t [4];
    array_t arr;

    initial begin
        byte a = 8'h8C;
        byte b = 8'h00;
        byte c = 8'hA4;
        byte d = 8'hFF;

        // packing 4 bytes into a 32-bit integer
        int value = {>>{a, b, c, d}};

        // 8C 00 A4 FF
        $display("value = %0h", value);

        // Reverse each 8 bits at once and pack 
        arr = '{a, b, c, d};
        value = {<<8{arr}};

        // FF A4 00 8C
        $display("value = %0h", value);

        // Reverse bit by bit and pack
        // before reverse: 1000 1100 0000 0000 1010 0100 1111 1111
        // after reverse:  1111 1111 0010 0101 0000 0000 0011 0001
        value = {<<{a, b, c, d}};
        $display("value = %0h", value);

        // Reverse 4 bits at once and pack
        // before reverse: 1000 1100 0000 0000 1010 0100 1111 1111
        // after reverse:  1111 1111 0100 1010 0000 0000 1100 1000
        value = {<<4{a, b, c, d}};
        $display("value = %0h", value);

    end

endmodule


/* 
Notes:
    
    You can also give a slice size, which is used to break up the source before being 
    streamed. 
    
    You can not assign the bit stream result directly to an unpacked array. Instead, 
    use the streaming operators on the left side of an assignment to unpack the bit 
    stream into an unpacked array. 

*/