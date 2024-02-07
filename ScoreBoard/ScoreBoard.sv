/*
    purpose: This file contains example of score board
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module score_board();

    // Define a struct
    typedef struct {
        bit [7:0] address;
        bit [7:0] pr;
        bit [15:0] data;} Packet;

    // Define a struct queue
    Packet queue [$];

    //Function to search for address
    function void check_address( bit [7:0] address);
        int intq[$];
        intq = queue.find_index() with (item.address == address);
        case (intq.size())
            0: $display("Address %h not found", address);
            1: queue.delete(intq[0]);
            default: $display("ERROR: Multiple hits for address %h",address);
        endcase
    endfunction : check_address

    initial begin
        queue.push_back('{ 100, 2, 365});
        queue.push_back('{ 101, 3, 366});
        queue.push_back('{ 102, 4, 367});
        queue.push_back('{ 102, 5, 368});
        
        $display("Queue size: %0d", queue.size());

        // Check for address
        check_address(101);
        $display("Queue size: %0d", queue.size());

        // Check for address
        check_address(102);
        $display("Queue size: %0d", queue.size());

        // Check for address
        check_address(105);
        $display("Queue size: %0d", queue.size());
    end

endmodule

