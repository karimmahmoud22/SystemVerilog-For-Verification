bit running =1;

module bus ( bus_interface.dut abc );

    always @(posedge abc.clk) begin
        if (running) begin
            $display("Data: %d, Port: %d", abc.data, abc.port);
        end
    end


endmodule