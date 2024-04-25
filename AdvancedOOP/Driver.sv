/*
    purpose: This file contains example of Driver in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Driver;

    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task main();
        Transaction tr; 

        forever begin
            // get the transaction from the upstream generator
            gen2drv.get(tr);
            // Process the transaction
            tr.crc_calculate();
            // Drive the interface signals to send the transaction to the downstream
            @ifc.cb.src = src;
            // ....
        end

    endtask

endclass

/*
output: 
*/