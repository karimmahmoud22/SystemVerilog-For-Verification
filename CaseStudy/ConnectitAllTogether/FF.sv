module ff ( ff_int dut);

    always @(dut.cb) begin
        if (dut.reset) begin
            dut.cb.q <= 1'b0;
        end
        else begin
            dut.cb.q <= dut.d;
        end
    end

endmodule