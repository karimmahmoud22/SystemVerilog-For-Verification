bit running = 1;
typedef enum { INIT, DECODE, IDLE } fsmstate_e;

interface fsmifc ( input bit clk );

    bit pi;
    bit po;
    bit reset;
    fsmstate_e state;

    clocking cb_tb @(posedge clk);
        input state;
    endclocking

    clocking cb_dut @(posedge clk);
        output state;
    endclocking


    modport tb ( output pi, reset, clocking cb_tb);
    modport dut ( input pi, reset, output po, clocking cb_dut );

endinterface