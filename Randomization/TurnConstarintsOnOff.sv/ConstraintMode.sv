/*
    purpose: This file contains example of implication
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top;
    class Instruction;
        typedef enum { NOP, HALT, CLR, NOT } OPCODE_T;
        rand OPCODE_T opcode;
        bit [1:0] operands;

        constraint c_no_operands{
            opcode == NOP || opcode == HALT;
        }

        constraint c_one_operands{
            opcode == CLR || opcode == NOT;
        }
    endclass

    Instruction i;

    initial begin
        i = new();

        // Generate an instruction with no operands
        i.constraint_mode(0);       // Turn off all constraints
        i.c_no_operands.constraint_mode(1); // Turn on the no operands constraint
        assert (i.randomize()) 
        else $fatal("Randomization failed");
        $display("opcode = %0s, operands = %0d", i.opcode.name(), i.operands);

        // Generate an instruction with one operand
        i.constraint_mode(0);       // Turn off all constraints
        i.c_one_operands.constraint_mode(1); // Turn on the one operands constraint
        assert (i.randomize()) 
        else $fatal("Randomization failed");
        $display("opcode = %0s, operands = %0d", i.opcode.name(), i.operands);
    end
endmodule

