/*
    purpose: This file contains example of an interface with tasks for parallel protocol
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/


interface simple_if(input logic clk);
    logic [7:0] addr;
    logic [7:0] data;
    bus_cmd_e cmd;

    modport TARGET  (    input addr, cmd, data,
                        import task targetRcv (output bus_cmd_e c, logic [7:0] a, d)
                    );

    modport INITIATOR ( output addr, cmd, data,
                        import task initiatorSend(input bus_cmd_e c, logic [7:0] a, d)
                    );

    // Parallel send
    task initiatorSend(input bus_cmd_e c, logic [7:0] a, d);
        @(posedge clk);
        cmd <= c;
        addr <= a;
        data <= d;
    endtask
    
    // Parallel receive
    task targetRcv(output bus_cmd_e c, logic [7:0] a, d);
        @(posedge clk);
        a = addr;
        d = data;
        c = cmd;
    endtask

endinterface: simple_if