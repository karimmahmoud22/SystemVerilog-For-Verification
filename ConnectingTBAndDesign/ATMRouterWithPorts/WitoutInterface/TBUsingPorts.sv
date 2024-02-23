/*
    purpose: This file contains example of TB
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

module test(
    // 4 x Level 1 Utopia ATM layer Rx Interfaces
    Rx_clk_0, Rx_clk_1, Rx_clk_2, Rx_clk_3,
    Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3,
    Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3, 
    Rx_en_0, Rx_en_1, Rx_en_2, Rx_en_3, 
    Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3,

    // 4 x Level 1 Utopia ATM layer Tx Interfaces
    Tx_clk_0, Tx_clk_1, Tx_clk_2, Tx_clk_3,
    Tx_data_0, Tx_data_1, Tx_data_2, Tx_data_3,
    Tx_soc_0, Tx_soc_1, Tx_soc_2, Tx_soc_3, 
    Tx_en_0, Tx_en_1, Tx_en_2, Tx_en_3, 
    Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3,
    
    // Miscellaneous control interfaces
    clk, rst);

    input Rx_clk_0, Rx_clk_1, Rx_clk_2, Rx_clk_3;
    output [7:0] Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3;
    reg [7:0] Rx_data_0, Rx_data_1, Rx_data_2, Rx_data_3;
    output Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3;
    reg Rx_soc_0, Rx_soc_1, Rx_soc_2, Rx_soc_3;
    input Rx_en_0, Rx_en_1, Rx_en_2, Rx_en_3;
    output Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3;
    reg Rx_clav_0, Rx_clav_1, Rx_clav_2, Rx_clav_3;

    input Tx_clk_0, Tx_clk_1, Tx_clk_2, Tx_clk_3;
    input [7:0] Tx_data_0, Tx_data_1, Tx_data_2, Tx_data_3;
    input Tx_soc_0, Tx_soc_1, Tx_soc_2, Tx_soc_3; 
    input Tx_en_0, Tx_en_1, Tx_en_2, Tx_en_3;
    output Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3;
    reg Tx_clav_0, Tx_clav_1, Tx_clav_2, Tx_clav_3;

    output rst;
    reg rst;
    
    input clk;
endmodule