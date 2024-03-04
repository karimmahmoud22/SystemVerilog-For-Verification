/*
    purpose: This file contains example of constrainted random class
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constrainted_random();

    class stim;

        const bit [31:0] SRC_CONGEST_ADDR = 42;
        typedef enum { READ, WRITE, CONTROL } stim_t;
        randc stim_t type1;
        rand bit [31:0] len, src, dst;
        bit congestion_test;

        rand bit [15:0] a, b, c;

        constraint good{
            0 < a;
            a < b;
            b < c;
        }

        // Error: won't work
        constraint bad{
            0 < a < b < c;
        }

        constraint c_stim {
            len >0;
            len<1000;
            src inside {0, [2:10], [100:107] };
            if( congestion_test ) {
                dst inside { [SRC_CONGEST_ADDR-100 : SRC_CONGEST_ADDR+100] };
            }
        }
    endclass
endmodule

/*
Note:
    - Ues == operator instead of = to assign a value to a random variable
*/