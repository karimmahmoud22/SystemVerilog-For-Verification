/*
    purpose: This file contains example of TB program ofATM Router header with interface
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

const int ATM_CELL_SIZE 100;

program automatic test( Rx_if.TB Rx0, Rx1, Rx2, Rx3,
                        Tx_if.TB Tx0, Tx1, Tx2, Tx3,
                        input logic clk,
                        output logic rst );

    bit [7:0] bytes [ ATM_CELL_SIZE ];

    initial begin
        //Reset the device
        rst <=1;
        Rx0.cb.data <= 0;
        // continue the code
        receive_cell0();
    end

    task receive_cell0();
        @(Tx.cb);
        Tx0.cb.clav <= 1;                   // Assert ready to receive
        wait( Tx0.cb.soc == 1 );             // Wait for start of the cell
        for ( int i=0 ; i < ATM_CELL_SIZE ; ++i ) begin
            wait ( Tx.cb.en == 0 );          // Wait for enable
                @(Tx.cb);
            
            bytes[i] = Tx0.cb.data;
            @(Tx.cb);
            Tx0.cb.clav <= 0;               // Deassert flow control
        end
    endtask: receive_cell0

endprogram: test