/*
    purpose: This file contains example of dynamic threads
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

program automatic test( busif.TB bus );
    task wait_for_tr( Transcation tr );
        fork 
            begin
                wait( bus.tr.addr != tr.addr );
                $display("Transaction is done");
            end
        join_none
    endtask
endprogram

module top;

    Transaction tr;

    initial begin
        repeat(10) begin
            tr = new;
            if ( ! tr.randomize() ) $finish;

            //Send it to DUT
            transmit(tr);

            // Wait for the transaction to be done
            wait_for_tr(tr);
        end
    end
endmodule


/*
Note:
  
Output:

*/