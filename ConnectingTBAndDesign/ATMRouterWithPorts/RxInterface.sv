/*
    purpose: This file contains example of Rx Interface
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

interface Rx_if ( input logic clk );
    logic [7:0] data;
    logic soc, en, clav, rclk;

    clocking cb @( posedge clk );
        output data, soc, clav;
        input en;
    endclocking: cb

    modport DUT ( output en, rclk,
                  inout data, soc, clav );
    modport TB ( clocking cb);
endinterface: Rx_if