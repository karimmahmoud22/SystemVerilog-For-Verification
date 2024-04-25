/*
    purpose: This file contains example of using mailboxes
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Transaction;

    rand bit [1:0] kind;
    rand bit [7:0] data;

    function new();
        kind = 2'b0;
        data = 8'h00;
    endfunction

    function string to_string();
        return $sformatf("Transaction: kind=%0d, data=%0h", kind, data);
    endfunction

    function void display();
        $display("Transaction: kind=%0d, data=%0h", kind, data);
    endfunction

endclass

class Generator;

    Transaction tr;
    mailbox mb;

    function new(mailbox mb);
        this.mb = mb;   
    endfunction

    task run();
        repeat(10) begin
            tr = new();
            assert (tr.randomize());
            mb.put(tr);
            #10;
        end
    endtask

endclass

class Driver;

    Transaction tr;
    mailbox mb;

    function new(mailbox mb);
        this.mb = mb;
    endfunction

    task run();
        repeat(10) begin
            mb.get(tr);
            /*
            @(posedge busif.cb.ack);
            bus.cb.kind <= tr.kind;
            ....
            */
            $display("Transaction: %p", tr);
            #10;
        end
    endtask

endclass

program automatic mailbox_example;

    mailbox mb;
    Generator gen;
    Driver drv;

    initial begin
        mb = new();
        gen = new(mb);
        drv = new(mb);
        fork
            gen.run();
            drv.run();
        join
        $display("Simulation finished");
    end
  
endprogram


/*
Note:
    - You can make bounded mailboxes by using the new(size = 1 for example) function
    - in this case you can not put more than 1 item in the mailbox till the mail box is empty
output:
*/