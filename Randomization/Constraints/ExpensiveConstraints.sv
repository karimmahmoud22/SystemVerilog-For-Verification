/*
    purpose: This file contains example of expensive constraints
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module expensive_constraints();
    class expensive_cons;
        rand bit [31:0] addr;

        // Expensive constraint
        constraint c_addr1 {
            addr % 4096 inside { [0:20] , [4075:4095] };
        }

        // cheap one
        constraint c_addr2 {
            addr [11:0] inside { [0:20] , [4075:4095] };
        }

    endclass

    expensive_cons ec;

    initial begin
        ec = new();
        repeat( 10 ) begin
            assert( ec.randomize() );
            $display("addr = %0d", ec.addr);
        end
    end
endmodule

/*
Note:
    Expensive constraints are constraints that are computationally expensive to solve such as modulo, multiplication, division, etc.
    It is best to avoid using them as much as possible.

    Instead of that:
        - use bit extraction rather than division and modulo
        - use shift operation rather than multiplication
*/