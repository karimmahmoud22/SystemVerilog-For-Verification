/*
    purpose: This file contains example of constraint without random variable
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module bad();
    class bad;
        bit [31:0] son;
        constraint c_teenager{
            son > 12;
            son <20;
        };
    endclass

    bad b;
    initial begin
        b = new;
        assert(p.randomize());
    end
endmodule


/*

    ==> The code wil produce error beacuse constraint is related to variable which is not rand or randc

The error:
    Error found while trying to resolve cross-module reference.
    token 'p'.  Originating module 'bad'.
    Source info: p.randomize()
*/