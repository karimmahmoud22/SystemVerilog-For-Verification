//not program for coverage purpose
module test ( bus_interface.tb ifc );

    class Transaction;
        rand bit [31:0] d;
        rand bit [2:0] p;
        rand bit [1:0] k;
    endclass

    Transaction tr;

    covergroup CovPort;
        CP1: coverpoint ( tr.p + tr.k );        // 4-bit expression
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

You need to get all results of 3bits + 4bits = 4bits
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
we need 23 bins exactly
we can define it as the following:

    { bins test_bin[] = {[0:22]}; } inside the covergroup

*/
