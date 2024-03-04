/*
    purpose: This file contains example of dynamic distribution weights
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module dynamic_distribution_weights();

    class BusOp;
    typedef enum { BYTE, WORD, DWORD, QWORD } length_t;
    rand length_t len;

    // Random weights for distribution constraints
    bit [31:0] w_byte = 1, w_word = 3, w_dword = 5, w_qword = 7;

    // Choos a random length based on the variable weights
    constraint c_len {
        len dist {
            BYTE := w_byte,
            WORD := w_word,
            DWORD := w_dword,
            QWORD := w_qword
        };
    }
    endclass

    BusOp bus_op;

    initial begin
        bus_op = new();
        repeat( 10 ) begin
            assert( bus_op.randomize() );
            $display("len = %0s", bus_op.len.name());
        end
    end
endmodule