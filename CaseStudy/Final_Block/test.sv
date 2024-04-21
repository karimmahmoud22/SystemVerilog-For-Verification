program test (intf.tb abc);
    int errors =0;
    int warnings =0;

    initial begin
        $display("Value of abc.addr is %h", abc.addr);

        assertion_1: assert (abc.addr == 8'h00) 
        else begin
            errors++;
        end

        assertion_2: assert (errors == 0) 
        else begin
            $warning("wrong value of address");
            warnings++;
        end
    end

    final begin
        $display("Testbench finished");
        $display("Number of errors: %0d", errors);
        $display("Number of warnings: %0d", warnings);
    end
endprogram