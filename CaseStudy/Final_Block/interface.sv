interface intf();
    logic [7:0] addr;

    modport tb (input addr);
    modport dut (output addr);
endinterface