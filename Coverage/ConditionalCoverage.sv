covergroup CovPort;
    
    // Conditional coverage: if reset is 0, then cover the expression
    CP1: coverpoint tr.port iff ( ! reset );

endgroup

/*
you can use start and stop to control the coverage
    CovPort x;
    x = new();

    x.start();
    x.stop();

*/