module top;

    bit clk;
    initial begin
        clk = 0;
        while ( running ) begin
            #5 clk = ~clk;
        end

        fsmifc abc(clk);
        fsm dut(abc.dut);
        test tb(abc.tb);
    end

endmodule