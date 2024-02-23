/*
    purpose: This file contains example of top module of ATM Router header without interface
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

module top();

    bit clk;
    always #20 clk = ~clk;

    wire Rx_clk_0, Rx_clk_1, Rx_clk_2, Rx_clk_3;
    wire Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3;
    wire Rx_en_0, Rx_en_1, Rx_en_2, Rx_en_3;
    wire Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3;

    wire Tx_clk_0, Tx_clk_1, Tx_clk_2, Tx_clk_3;
    wire Tx_soc_0, Tx_soc_1, Tx_soc_2, Tx_soc_3; 
    wire Tx_en_0, Tx_en_1, Tx_en_2, Tx_en_3;
    wire Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3;

    wire [7:0] Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3;
    wire [7:0] Tx_data_0, Tx_data_1, Tx_data_2, Tx_data_3;

    atm_router a1 (

    Rx_clk_0, Rx_clk_1, Rx_clk_2, Rx_clk_3,
    Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3,
    Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3, 
    Rx_en_0, Rx_en_1, Rx_en_2, Rx_en_3, 
    Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3,

    Tx_clk_0, Tx_clk_1, Tx_clk_2, Tx_clk_3,
    Tx_data_0, Tx_data_1, Tx_data_2, Tx_data_3,
    Tx_soc_0, Tx_soc_1, Tx_soc_2, Tx_soc_3, 
    Tx_en_0, Tx_en_1, Tx_en_2, Tx_en_3, 
    Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3,
    
    clk, rst);

    test t1 (

    Rx_clk_0, Rx_clk_1, Rx_clk_2, Rx_clk_3,
    Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3,
    Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3, 
    Rx_en_0, Rx_en_1, Rx_en_2, Rx_en_3, 
    Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3,

    Tx_clk_0, Tx_clk_1, Tx_clk_2, Tx_clk_3,
    Tx_data_0, Tx_data_1, Tx_data_2, Tx_data_3,
    Tx_soc_0, Tx_soc_1, Tx_soc_2, Tx_soc_3, 
    Tx_en_0, Tx_en_1, Tx_en_2, Tx_en_3, 
    Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3,
    
    clk, rst);

endmodule