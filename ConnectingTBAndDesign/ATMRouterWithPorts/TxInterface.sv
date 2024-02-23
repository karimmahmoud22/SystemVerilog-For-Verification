/*
    purpose: This file contains example of Tx Interface
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

interface Tx_if ( input logic clk );
    logic [7:0] data;
    logic soc, en, clav, tclk;

    clocking cb @( posedge clk );
        input data, soc, en;
        output clav;
    endclocking: cb

    modport DUT ( output en, tclk, soc, data
                  inout clk, clav );
    modport TB ( clocking cb);
endinterface: Tx_if