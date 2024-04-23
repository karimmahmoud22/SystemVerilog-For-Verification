covergroup cg_fsm;
    CP1: coverpoint ifc.cb_dut {
        bins t1 = ( IDLE => INIT );
        bins t4 = ( IDLE => IDLE );
        bins t2 = ( INIT => DECODE );
        bins t5 = ( INIT => IDLE );
        bins t6 = ( DECODE => DECODE );
        bins t3 = ( DECODE => IDLE );
    }

endgroup