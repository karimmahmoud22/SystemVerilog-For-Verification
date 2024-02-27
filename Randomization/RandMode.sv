/*
    purpose: This file contains example of rand mode disabling
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    class Packet;
        rand bit [7:0] length;
        rand bit [7:0] payload [];
        constraint c_valid{
            length > 0;
            payload.size() == length;
        }

        function void print( string msg);
            $write("Packet Length = %0d, Payload Size = %0d, bytes = ", length, payload.size());
            for(  int i = 0; ( i<4 && i < payload.size() ) ; ++i ) begin
                $write(" %0d ", payload[i]);
                $display;
            end
        endfunction

    endclass

    Packet p;

    initial begin
        p = new();

        //Randomize all variables
        assert (p.randomize()) 
        else $fatal("Randomization failed");

        p.print("Randomized Packet");
        
        // Make kength non random then randomize packet
        p.length.rand_mode(0);
        p.length = 42;
        assert (p.randomize()) 
        else $fatal("Randomization failed");

        p.print("Randomized Packet with length with rand_mode = 42");
    end
endmodule

