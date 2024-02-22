/*
    purpose: This file contains examples of signal synchronization
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/

interface intf ( input bit clk );
    logic read, enable;
    logic [7:0] data, addr;
    
    clocking cb @(posedge clk);
        default input #10 output #2;
        output read, enable, addr;
        input data;
    endclocking

    modport dut ( input read , enable, addr, output data );
    modport tb ( clocking cb);

endinterface

program automatic test ( intf.tb bus );
    initial begin
        @bus.cb;                    // continue on active edge in clocking block
        //---------------
        // The following 2 are equivalent
        repeat(3) @bus.cb;          // wait for 3 active edges
        ##3;        // this delay works only as a prefix to a drive of a signal in a clocking block
        //---------------
        @bus.cb.read;               // wait for active edge in read signal
        @( posedge bus.cb.read );   // continue on the positive edge of read signal
        @( negedge bus.cb.read );   // continue on th enegative edge of the read signal
        wait ( bus.cb.read == 1 )   // wait for an expression ( No delay if already true )
        @( posedge bus.cb.read or negedge bus.cb.read );    //wait for several signals
    end
endprogram