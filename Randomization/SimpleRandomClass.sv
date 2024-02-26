/*
    purpose: This file contains example of simple random class
    Author: Karim Mahmoud Kamal
    Date:    23th of February 2024
*/

module simple_random_class();

    class Packet;
        // The random variables
        // rand ==> every time you randmomize a class, they will take a new valur ( such as rolling a dice )
        rand bit [31:0] src, dst, data[8];

        // randc ( c==> cyclic ) ==> The random solver does not repeat a random value until every possible value has been assigned
        randc bit [7:0] kind;

        // Limit the values for src
        constraint c { src > 10;
                    src < 15; };
    endclass

    Packet p;
    initial begin
        p = new();
        // randomize ==> return 0 in case of fail and 1 in case of success
        assert( p.randomize() );
    end

endmodule

