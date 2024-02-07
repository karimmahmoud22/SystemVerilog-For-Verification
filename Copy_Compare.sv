/*
    purpose: This file contains some operations on arrays using copy and compare operations
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module copy_compare();

    initial begin
        bit [31:0]  src [5] = '{0,1,2,3,4},
                    des [5] = '{5,4,3,2,1};

        if ( src == des )
            $display("1: src == des");
        else
            $display("1: src != des");

        // copy the content of src to des
        des = src;

        src[0] = 100; // src = {100,1,2,3,4}

        // ternaly operator in display statement
        $display( "2: src %s des", (src == des) ? "==" : "!=");

        // compare slice of src with des
        $display( "3: src[1:4] %s des[1:4]", (src[1:4] == des[1:4]) ? "==" : "!=");

    end

    //Bit subscripts
    initial begin
        //Same: int [31:0] src [5] = '{5{6}};
        bit [31:0] src [5] = '{5{6}};

        foreach( src[j] )
            $display("src[%0d] = %b", j, src[j]);

        // ,, ==> whitespace
        // src[0] = 6 ==> 0000 0000 0000 0000 0000 0000 0000 0110
        // src[0][0] = 0
        // src[0][2:1] = 11

        // displayb ==> display binary
        $displayb(src[0],,src[0][0],,src[0][2:1]);

    end

endmodule


/* 
    output:
    1: src != des
    2: src != des
    3: src[1:4] == des[1:4]
*/
