module fetch_dut ( fetch_interface fetch_int );

    logic [15:0] address, node_A, node_B, node_C;
    logic [15:0] program_counter_reg;

    assign fetch_int.next_program_counter = program_counter_reg + 1'b1;
    assign node_A = ( fetch_int.branch_taken) ? fetch_int.target_address : fetch_int.next_program_counter;
    assign node_B = ( fetch_int.state == CNTRL_UPDATE_PC) ? node_A : program_counter_reg;
    assign node_C = ( fetch_int.reset ) ? 16'h3000 : node_B;
    assign fetch_int.program_counter = ( fetch_int.state != CNTRL_READ_MEM &&
                                         fetch_int.state != CNTRL_WRITE_MEM &&
                                         fetch_int.state != CNTRL_IND_ADDR_RD) ? program_counter_reg : 16'hzzzz;
    assign fetch_int.read = ( fetch_int.state == CNTRL_READ_MEM ||
                             fetch_int.state == CNTRL_WRITE_MEM ||
                             fetch_int.state == CNTRL_IND_ADDR_RD) ? 1'b1 : 1'bz;

    always @(posedge fetch_int.clk) begin
        program_counter_reg <= node_C;
    end
endmodule