interface bus_interface ( input bit clk);

    bit [31:0] data;
    bit [2:0] port;

    clocking bus_clk @(posedge clk);
        output data;
        output port;
    endclocking

    modport dut ( input data, port, clk);
    modport tb ( clocking bus_clk);
    
endinterface