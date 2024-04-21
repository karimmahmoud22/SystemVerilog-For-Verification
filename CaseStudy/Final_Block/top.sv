module top;

    logic [7:0] addr;
    intf intf_i();
    designx dut_i (intf_i.dut);
    test tb_i (intf_i.tb);
    
endmodule