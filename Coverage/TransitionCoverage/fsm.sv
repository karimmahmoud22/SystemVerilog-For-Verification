module fsm ( fsmifc.dut abc );

    fsmstate_e pstate;

    always @(abc.reset) begin
        if ( abc.reset )
            pstate = IDLE;
    end

    always @(abc.cb_dut) begin
        case (pstate)
            IDLE: if ( abc.pi == 1 )begin
                pstate = INIT;
                abc.po = 0;
            end
            else begin
                pstate = IDLE;
                abc.po = 1;
            end
            INIT: if ( abc.pi == 1 )begin
                pstate = DECODE;
                abc.po = 1;
            end
            else begin
                pstate = IDLE;
                abc.po = 0;
            end
            DECODE: if ( abc.pi == 1 )begin
                pstate = IDLE;
                abc.po = 1;
            end
            else begin
                pstate = DECODE;
                abc.po = 1;
            end
            default: pstate = IDLE;
        endcase

        abc.cb_dut.state <= pstate;
    end

endmodule