/*
    purpose: This file contains example of constructor with argument in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Transaction;
    int val;

    function new(int val);
        this.val = val;
    endfunction

endclass

class BadTr extends Transaction;

    function new(int val);
        super.new(val);         // MUST BE THE FIRST LINE
        // Other constructor actions
    endfunction

endclass

program automatic test;


endprogram

/*
output: 
*/