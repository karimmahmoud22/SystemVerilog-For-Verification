module top( output bit clk);

    initial clk = 1'b0;
    always#5 clk = ~clk;

    ff_int ff1(clk);
    ff d1(ff1.dut);
    test t1(ff1.tb);

    initial begin
        $dumpfile( "mem.vcd" );
        $dumpvars;
        #200 $finish;
    end

endmodule