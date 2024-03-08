/*
    purpose: This file contains example of threads in class
    Author: Karim Mahmoud Kamal
    Date:    8th of March 2024
*/

class Generator;

    //Transcator that creates N packets
    task run ( int n );
        Packet p;

        fork
            repeat (n) begin
                p = new;
                if( !p.randomize() ) begin
                    $display("Error: Packet randomization failed");
                    $finish;
                end
                transmit(p);
            end
        join_none
    endtask

endclass

module top;
    Generator g;

    initial begin
        g = new;
        g.run(10);
        // Start the checker, Monitor, and other threads
    end
endmodule


/*
Note:
  
Output:

*/