/*
    purpose: This file contains casting examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module casting();

    initial begin
        int i;
        int ii;
        real r;
        
        // casting from real to int will truncate the decimal part
        i = int'(10.0 - 0.6);

        // automatic casting from real to int will truncate the decimal part
        ii = (10.0 - 0.6);

        // casting from int to real will add a decimal part
        r = real'(42);

        $display("i = %0d, r = %0f", i, r);
        $display("ii = %0d", ii);
    end

endmodule