/*
    purpose: This file contains casting examples in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

module constant();

    initial begin
        
        const byte colon = ":";
        $display("using const keyword: colon = %0s",colon);

    end

endmodule

