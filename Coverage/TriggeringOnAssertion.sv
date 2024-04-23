//not program for coverage purpose
module test ( bus_interface.tb ifc );
    
    event ready;

    class Transaction;
        rand bit [31:0] data;
        rand bit [2:0] port;
    endclass

    class Transactor;
        covergroup CovPort @ (ready);
            CP1: coverpoint tr.p;
        endgroup
    
        function new;
            CovPort xyz;
            xyz = new();    
        endfunction

        task main;
            // The assertion triggers the event ready when randomize() is successful
            assert( tr.randomize() ) -> ready;
            ifc.cb.data <= tr.data;
            ifc.cb.port <= tr.port;

            //CovPort.sample();               // write in cover report
            @ifc.bus_clk;
        endtask

    endclass

    Transactor tr;

    initial begin
        tr = new();

        repeat(10) begin
            tr.main();
        end

        running = 0;
        $display("Coverage: %f", xyz.get_coverage() );

    end

endmodule