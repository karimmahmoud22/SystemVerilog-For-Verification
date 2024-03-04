/*
    purpose: This file contains example of constrainted random class
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constrainted_random();

    class stim;
        rand int c;
        int lo, hi;

        // lo <= c <= high
        constraint c_range{
            c inside {[lo:hi]};
        }

        // lo > c && c > high
        constraint c_range_inv{
            ! ( c inside {[lo:hi]} );
        }

    endclass
endmodule