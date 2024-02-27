/*
    purpose: This file contains example of external constraint
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top_packet;
    class Packet;
        rand bit [7:0] length;
        rand bit [7:0] payload [];
        constraint c_length{
            length > 0;
            length == payload.size();
        }

        constaint c_external;
    endclass
endmodule

program automatic test
    constaint Packet::c_external{
        length == 1;
    }
endprogram

module top;

    Packet p;

    initial begin
        p = new();
        assert (p.randomize()) 
        else $fatal("Randomization failed");
        $display("length = %0d", p.length);
    end

endmodule