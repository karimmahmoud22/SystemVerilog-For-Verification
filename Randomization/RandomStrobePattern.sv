/*
    purpose: This file contains example of random strobe pattern
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

parameter MAX_TRANSFER_LEN = 10;

module top;
    class strobe_pattern;
        rand bit strobe [MAX_TRANSFER_LEN];
        constraint c_set_four{
            strobe.sum() == 3'h4;
        }
    endclass

    strobe_pattern s;
    int count;
    
    initial begin
        s = new();
        count= 0;
        
        assert (s.randomize()) 
        else $fatal("Randomization failed");

        foreach(s.strobe[i]) begin
            if( s.strobe[i] == 1) begin
                $display("Strobe[%0d] = 1", i);
                count++;
            end
        end
    end
endmodule

