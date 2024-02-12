/*
    purpose: This file contains passing arguments by name
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module passing_arguments_by_name();

    task many(input int a=1, b=2, c=3, d=4);
        $display("a=%0d, b=%0d, c=%0d, d=%0d", a, b, c, d);
    endtask

    initial begin
        many(6,7,8,9);
        many();
        many(.c(100));
        many(.a(100), .c(200));
        many(,6,.d(8));
    end

endmodule

/*
output:
    a=6, b=7, c=8, d=9
    a=1, b=2, c=3, d=4
    a=1, b=2, c=100, d=4
    a=100, b=2, c=200, d=4
    a=1, b=6, c=3, d=8
*/