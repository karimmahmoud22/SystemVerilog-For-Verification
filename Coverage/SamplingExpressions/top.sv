module top;

    bit clk;
    initial begin
        clk = 0;
        while ( running == 1 ) begin
            #5 clk = ~clk;
        end

        bus_interface u1 (clk);
        bus dut(u1.dut);
        test tb(u1.tb);
    end

endmodule