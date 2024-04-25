/*
    purpose: This file contains example of Generator in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Generator;

    mailbox gen2drv;
    Transaction blueprint;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    function build_transaction();
        blueprint = new();
    endfunction

    task run();
        Transaction tr;
        forever begin
            assert ( blueprint.randomize() )  else $fatal("Failed to randomize transaction");
            tr = blueprint.copy;
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