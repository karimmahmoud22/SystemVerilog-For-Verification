class BusOp;

    typedef enum {BYTE, WORD, LWORD} length_e;
    rand length_e len;

    bit [31:0] w_byte=1, w_word=3, w_lword=5;

    constraint c_len {
        len dist{  BYTE:/w_byte, 
                    WORD:/w_word, 
                    LWORD:/w_lword };
    }

endclass


program test;

    BusOp bus_op;

    initial begin
        bus_op = new();
        for ( int j=1 ; j<=10 ; j++ ) begin
            // display creates a new line
            $display(" ");
            for ( int i = 1; i <= 10; i++ ) begin
                assert(bus_op.randomize())
                else $fatal(0, "Randomization failed");
                // write does not create a new line
                $write(bus_op.len.name, ", ");
            end
        end
    end

endprogram

/*
LWORD, WORD, LWORD, WORD, BYTE, WORD, BYTE, BYTE, WORD, LWORD,  
LWORD, BYTE, BYTE, LWORD, WORD, WORD, WORD, WORD, LWORD, WORD,  
LWORD, LWORD, LWORD, BYTE, LWORD, LWORD, WORD, LWORD, LWORD, LWORD,  
LWORD, WORD, LWORD, LWORD, WORD, LWORD, LWORD, WORD, WORD, LWORD,  
WORD, BYTE, WORD, WORD, LWORD, LWORD, WORD, WORD, LWORD, LWORD,  
LWORD, LWORD, WORD, WORD, LWORD, LWORD, LWORD, BYTE, LWORD, WORD,  
WORD, LWORD, LWORD, WORD, WORD, WORD, LWORD, BYTE, WORD, WORD,  
LWORD, WORD, WORD, LWORD, LWORD, WORD, WORD, BYTE, WORD, LWORD,  
BYTE, LWORD, LWORD, LWORD, WORD, BYTE, BYTE, LWORD, LWORD, LWORD,  
LWORD, WORD, WORD, LWORD, LWORD, LWORD, WORD, BYTE, LWORD, WORD,
*/