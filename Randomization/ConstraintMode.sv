/*
    purpose: This file contains example of constraint mode in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constraint_mode();
    class Packet;
        rand int length;
        constraint c_short {
            length inside { [1:32] };
        }
        constraint c_long {
            length inside { [1000:1023] };
        }
    endclass

    Packet p;

    initial begin
        p = new();
        
        // Create a long packet by disabling the short constraint
        p.c_short.constraint_mode(0);
        assert( p.randomize() );
        $display("Long packet: length = %0d", p.length);

        // Create a short packet by disabling all constraints then enabling the short constraint
        p.constraint_mode(0);
        p.c_short.constraint_mode(1);
        assert( p.randomize() );
        $display("Short packet: length = %0d", p.length);
    end
endmodule

