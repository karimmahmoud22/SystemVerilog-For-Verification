/*
    purpose: This file contains example of constraint with implication operator
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constraint_with_implication_operator();
    class constraint_with_implication;
        typedef enum { BYTE, WORD, DWORD, QWORD } length_t;
        rand length_t len;

        constraint c_len {
            len inside { BYTE, WORD, DWORD, QWORD };
            len == BYTE -> len != QWORD;
            len == WORD -> len != DWORD;
        }
    endclass

    constraint_with_implication cwi;

    initial begin
        cwi = new();
        repeat( 10 ) begin
            assert( cwi.randomize() );
            $display("len = %0s", cwi.len.name());
        end
    end
endmodule


/*
Note:
    1- best to use implication operator when used for enum types
    2- best to use if-else when used for boolean types
*/