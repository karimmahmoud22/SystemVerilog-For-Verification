interface bus_interface ( input bit clk);

    bit [31:0] data;
    bit [2:0] port;
    bit [3:0] kind;

    clocking bus_clk @(posedge clk);
        output data, port, kind;
    endclocking

    modport tb ( clocking bus_clk);
    modport dut ( input data, port, kind);
    
endinterface