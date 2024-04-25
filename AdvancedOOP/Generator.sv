/*
    purpose: This file contains example of Generator in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Generator;

    mailbox gen2drv;
    Transaction tr;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    function build_transaction();
        tr = new();
        assert ( tr.randomize() )  else $fatal("Failed to randomize transaction");
    endfunction

    task run();

        forever begin
            // Build a new transaction
            build_transaction();
            // Send the transaction to the downstream driver
            gen2drv.put(tr);
        end
    endtask

    task wrapup();
        gen2drv.put(null);
    endtask

endclass

/*
output: 
*/