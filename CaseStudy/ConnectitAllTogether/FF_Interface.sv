interface ff_int( input bit clk );

    logic reset, d, q;

    clocking cb @(posedge clk);
        output q;
    endclocking

    modport dut ( clocking cb, input reset, d);
    modport tb ( input q, output reset, d);
endinterface