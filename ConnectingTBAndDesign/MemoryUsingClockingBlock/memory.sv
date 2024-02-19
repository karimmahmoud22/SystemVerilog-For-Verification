/*
    purpose: This file contains exapmle of memory
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module memory( intf.dut intf_dut );
    logic [7:0] mem [256]; 

    initial begin
        foreach ( mem[i] )
            mem[i] = i*i;
    end

    always @( intf_dut.enable , intf_dut.read ) begin
        if ( ( intf_dut.enable == 1 ) && ( intf_dut.read == 1 ) )
            // we can make blocking or non-blocking assignment
            intf_dut.data = mem[intf_dut.addr];
    end

endmodule