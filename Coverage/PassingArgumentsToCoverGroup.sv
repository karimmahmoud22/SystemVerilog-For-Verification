// Note that the port is send by reference
covergroup CovPort ( ref bit [2:0] port , input int mid );

    CP1: coverpoint port
    {
        bins low = {[0:mid-1]};
        bins high = {[mid:$]};
    }


    CovPort cp;
    cp = new( tr.port, 4 );

endgroup

/*

*/