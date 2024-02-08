/*
    purpose: This file contains struct examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module struct1();

    initial begin

        typedef struct {
            int a;
            byte b;
            shortint c;
            int d;
        } my_struct_s;

        // d will be truncated as a is 32-bit ( 8 digits in hexadecimal )
        my_struct_s my_struct = '{32'hd_aaaa_aaaa,
                                  8'hbb,
                                  16'hcccc,
                                  32'hdddd_dddd};
        // x is equivalent to hexadecimal
        $display("1: my_struct.a: %0x", my_struct.a);
        $display("2: my_struct.b: %0x", my_struct.b);
        $display("3: my_struct.c: %0x", my_struct.c);
        $display("4: my_struct.d: %0x", my_struct.d);

    end

endmodule