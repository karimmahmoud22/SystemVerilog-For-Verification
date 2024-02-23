/*
    purpose: This file contains example of Top module ofATM Router header with interface
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

module top();

    bit clk;
    always #20 clk = ~clk;

    Rx_if Rx0(clk), Rx1(clk), Rx2(clk), Rx3(clk);
    Tx_if Tx0(clk), Tx1(clk), Tx2(clk), Tx3(clk);

    atm_router a1 ( Rx0, Rx1, Rx2, Rx3,
                    Tx0, Tx1, Tx2, Tx3, clk, rst);

    test t1 ( Rx0, Rx1, Rx2, Rx3,
                    Tx0, Tx1, Tx2, Tx3, clk, rst);

endmodule: top