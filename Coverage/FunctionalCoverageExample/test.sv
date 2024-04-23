//not program for coverage purpose
module test ( bus_interface.tb ifc );

    class Transaction;
        rand bit [31:0] data;
        rand bit [2:0] port;
    endclass

    Transaction tr;

    covergroup CovPort;
        CP1: coverpoint tr.p;
    endgroup

    initial begin
        CovPort xyz;
        xyz = new();
        tr = new();

        repeat(10) begin
            assert( tr.randomize() );
            xyz.sample();               // write in cover report
            @ifc.bus_clk;
        end

        running = 0;
        $display("Coverage: %f", xyz.get_coverage() );

    end

endmodule


/*
Practical note: 
    • If $finish is called explicitly, or implicitly (when a program finishes execution), 
    eda playground will not run the TCL file run.do, and you will not see the detailed report.
    You will see only the line reporting the coverage from the get_coverage() function. 
    • That is why we used a module for the testbench instead of a program.
*/