/*
    purpose: This file contains example of basic transcator using mailbox
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Agent

    mailbox gen2agt, agt2drv;
    transaction tr;

    function new(mailbox gen2agt, mailbox agt2drv);
        this.gen2agt = gen2agt;
        this.agt2drv = agt2drv;
    endfunction

    function build_transaction(int data);
        tr = new();
        tr.data = data;
    endfunction

    task run();
        int data;
        forever begin
            gen2agt.get(data);
            build_transaction(data);
            agt2drv.put(tr);
        end
    endtask

    task wrapup();
        tr = new();
        tr.data = -1;
        agt2drv.put(tr);
    endtask

endclass

