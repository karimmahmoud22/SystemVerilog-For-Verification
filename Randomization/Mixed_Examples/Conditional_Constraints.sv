class BusOp;

    typedef enum {BYTE, WORD, LWORD} length_e;
    enum {READ, WRITE} operation_e;
    
    rand length_e len;

    bit [31:0] w_byte=1, w_word=3, w_lword=5;

    constraint c_len {
        len dist{  BYTE:/w_byte, 
                    WORD:/w_word, 
                    LWORD:/w_lword };
    }

    constraint c_len_rw {
        if ( operation_e == READ ) {
            len inside { [BYTE:LWORD]};
        }
        else {
            len == LWORD;
        }
    }

endclass


program test;

    BusOp bus_op;

    initial begin
        bus_op = new();
        bus_op.operation_e = 0;
        for ( int i = 1; i <= 10; i++ ) begin
            assert(bus_op.randomize())
            else $fatal(0, "Randomization failed");
            // write does not create a new line
            $write(bus_op.operation_e.name, ": ");
            $display(bus_op.len.name);
        end
    end

endprogram

/*
READ: LWORD
READ: WORD
READ: LWORD
READ: WORD
READ: BYTE
READ: WORD
READ: BYTE
READ: BYTE
READ: WORD
READ: LWORD
*/