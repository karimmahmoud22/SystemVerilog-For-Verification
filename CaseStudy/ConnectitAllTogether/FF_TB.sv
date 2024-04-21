program test ( ff_int tb );

    initial begin
        $monitor( "@ %0t: tb.cb.q = %b", $time, tb.q);
        tb.reset = 1'b1;
        tb.d = 1'b0;
        #22 tb.reset = 1'b0;
        #10 tb.d = 1'b1;
        #5 tb.d = 1'b0;
        #10;
    end

endprogram