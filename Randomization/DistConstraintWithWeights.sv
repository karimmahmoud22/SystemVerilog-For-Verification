/*
    purpose: This file contains example of distribution constraint with weights
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module top;
    typedef enum { READ8, READ16, READ32 } read_t;
    class ReadCommands;
        rand read_t read_cmd;
        int read8_wt=1, read16_wt=1, read32_wt=1;
        constraint c_read {
            read_cmd dist {
                READ8 := read8_wt,
                READ16 := read16_wt,
                READ32 := read32_wt
            };
        }
    endclass

    ReadCommands r;

    initial begin
        r = new();
        repeat(10) begin
            r.randomize();
            $display("Read Command = %0s", r.read_cmd.name());
        end
    end
endmodule

