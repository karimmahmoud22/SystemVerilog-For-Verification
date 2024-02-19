/*
    purpose: This file contains exapmle of memory
    Author: Karim Mahmoud Kamal
    Date:    19th of February 2024
*/

module memory ( start, write , addr , data );

    input start , write, addr , data;
    wire [7:0] addr , data;

    logic [7:0] mem [256];

    always @( posedge start) begin
        if( write )
            mem[addr] = data;
        $display("--------------------------");
        $display("mem[%0d] = %0d ", addr , mem[addr]);
    end

    initial begin
        $dumpfile("mem.vcd");
        $dumpvars;
        #100 $finish;
    end

endmodule