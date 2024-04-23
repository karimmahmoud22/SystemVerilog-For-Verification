module top;

    bit clk;
    initial begin
        clk = 0;
        while ( running ) begin
            #5 clk = ~clk;
        end

        bus_interface abc(clk);
        bus dut(abc.dut);
        test tb(abc.tb);
    end

endmodule