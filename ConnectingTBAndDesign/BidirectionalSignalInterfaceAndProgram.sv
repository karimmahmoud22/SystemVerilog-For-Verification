/*
    purpose: This file contains examples of bidirectional signal
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/

interface master_if ( input bit clk );
    wire [7:0] data;
    clocking cb @(posedge clk);
    default input #5 output #2;
        inout data;
    endclocking

    modport test( clocking cb);
endinterface

program automatic test( master_if.test mif );
    initial
        begin
            mif.cb.data <= 'z;          //Tri-state the bus
            @mif.cb;
            $display("Data = %h", mif.cb.data);
            @mif.cb;
            mif.cb.data <= 7'ha;    //Drive the bus
            $display("Data = %h", mif.cb.data);
            @mif.cb;
            mif.cb.data <= 'z;          //Release the bus
            $display("Data = %h", mif.cb.data);
        end
endprogram

module top();

    bit clk;
    always#20 clk = ~clk;

    master_if m1 (clk);
    test t1 ( m1 );

    initial begin
        $dumpfile( "mem.vcd" );
        $dumpvars;
        #200 $finish;
    end

endmodule