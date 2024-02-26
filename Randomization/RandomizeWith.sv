/*
    purpose: This file contains example of In-line constraint mode in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module constraint_mode();
    class Transaction;
        rand bit [31:0] addr, data;
        constraint c1 {
            addr inside { [0:100] , [1000:2000] };
        }
    endclass

    Transaction t;

    initial begin
        int s;
        t = new();

        // addr is 50-100 , 1000-1500 and data <10
        assert ( t.randomize() with { 
                addr >= 50; addr <= 1500; data < 10; } 
            );

        $display("addr = %0d, data = %0d", t.addr, t.data);

        assert ( t.randomize() with { 
                addr == 2000 ; data < 10; } 
            );

        $display("addr = %0d, data = %0d", t.addr, t.data);
    end
endmodule

