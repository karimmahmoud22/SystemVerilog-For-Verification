`timescale 1ns / 1ns

typedef enum {
    CNTRL_UPDATE_PC = 0,
    CNTRL_FETCH = 1,
    CNTRL_DECODE = 2,
    CNTRL_EXECUTE = 3,
    CNTRL_UPDATE_REGF = 4,
    CNTRL_COMPUTE_PC = 5,
    CNTRL_COMPUTE_MEM = 6,
    CNTRL_READ_MEM = 7,
    CNTRL_IND_ADDR_RD = 8,
    CNTRL_WRITE_MEM = 9
} control_e;

module top();

    bit clk;
    always #10 clk = ~clk;

    fetch_interface fetch_int( clk );
    fetch_dut fetch_dut( fetch_int.fetch_dut );
    fetch_test fetch_test( fetch_int.fetch_tb, fetch_int.fetch_monitor );

    initial begin
        $dumpfile("fetch.vcd");
        $dumpvars;
        $display("Starting Fetch Test");
        #1000;
        $display("Ending Fetch Test");
        $finish;
    end
endmodule