/*
    purpose: This file contains example of TB with virtual interface
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/

program automatic test ( Rx_interface.TB Rx0 , Tx_interface.TB Tx0, 
                         Rx_interface.TB Rx1 , Tx_interface.TB Tx1, 
                         Rx_interface.TB Rx2 , Tx_interface.TB Tx2, 
                         Rx_interface.TB Rx3 , Tx_interface.TB Tx3);

    Driver drv[4];
    Monitor mon [4];
    Scoreboard sb [4];

    virtual Rx_if.TB vRx [4]= '{Rx0, Rx1, Rx2, Rx3};
    virtual Tx_if.TB vTx [4]= '{Tx0, Tx1, Tx2, Tx3};

    initial begin
        foreach( sb[i] ) begin
            sb[i] = new();
            drv[i] = new( sb[i].exp_mbx, i, vRx[i]);
            mon[i] = new( sb[i].rcv_mbx, i, vTx[i]);
        end
    end

endprogram
