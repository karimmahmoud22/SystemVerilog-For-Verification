/*
    purpose: This file contains example of random case
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;    

    initial begin
        int len;
        for( int i=0 ; i<10 ; ++i) begin
            randcase
                1: len = $urandom_range(0, 2);      // 10%: 0,1,2
                8: len = $urandom_range(3, 5);      // 80%: 3,4,5
                1: len = $urandom_range(6, 7);      // 10%: 6,7
            endcase
            $display("len = %0d", len);
        end
    end

endmodule

/*
Note:
    - urandomrange ==> returns a random number in the specified range
    - constraint is more compact than randcase
Output:
    len = 5
    len = 3
    len = 5
    len = 3
    len = 5
    len = 2
    len = 5
    len = 3
    len = 5
    len = 2
*/