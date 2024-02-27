/*
    purpose: This file contains example of implication
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    class Instruction;
        typedef enum { NOP, HALT, CLR, NOT } OPCODE_T;
        rand OPCODE_T opcode;
        bit [1:0] operands;

        constraint c_operands{
            if ( operands == 0 )
                opcode == NOP || opcode == HALT;
            else
                opcode == CLR || opcode == NOT;
        }
    endclass

    Instruction i;

    initial begin
        i = new();
        repeat(10) begin
            assert (i.randomize()) 
            else $fatal("Randomization failed");
            $display("opcode = %0s, operands = %0d", i.opcode.name(), i.operands);
        end
    end
endmodule

/*
Note:
    - Here there are large constraints ( Try not to do this in real life)
    - Be modular and use different constaints to enable and disable constraints
*/