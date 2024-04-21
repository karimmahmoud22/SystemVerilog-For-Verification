class Stim;

    const bit [31:0] CONGEST_ADDR = 42;
    typedef enum {READ, WRITE, CONTROL} stim_e;
    randc stim_e king;
    rand bit [31:0] len, src, dst;
    randc bit congestion_test;

    constraint c_stim {
        len > 0;
        len < 1000;
        if ( congestion_test == 1'b1 ) {
            dst inside {[CONGEST_ADDR+50:CONGEST_ADDR+100]};
            src == CONGEST_ADDR;
        }
        else {
            src inside {0,[2:10],[100:107]};
        }
    }
endclass


program test;
    Stim stim;

    initial begin
        stim = new();
        for ( int i = 0; i <= 5; i++ ) begin
            assert(stim.randomize())
            else $fatal(0, "Randomization failed");
            $display("%p", stim);
        end
    end
endprogram

/*
'{CONGEST_ADDR:'h2a, king:CONTROL, len:'hd2, src:'h4, dst:'heaba8d58, congestion_test:'h0}
'{CONGEST_ADDR:'h2a, king:READ, len:'hf2, src:'h2a, dst:'h84, congestion_test:'h1}
'{CONGEST_ADDR:'h2a, king:WRITE, len:'h268, src:'ha, dst:'h663fb6af, congestion_test:'h0}
'{CONGEST_ADDR:'h2a, king:CONTROL, len:'h2fa, src:'h2a, dst:'h8e, congestion_test:'h1}
'{CONGEST_ADDR:'h2a, king:WRITE, len:'hdc, src:'h2a, dst:'h73, congestion_test:'h1}
'{CONGEST_ADDR:'h2a, king:READ, len:'h82, src:'h66, dst:'h8afb3ba5, congestion_test:'h0}
*/