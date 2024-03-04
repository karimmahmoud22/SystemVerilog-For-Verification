/*
    purpose: This file contains example of random sequence
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;    

    //Tasks
    task cfg_read_task;
        $display("cfg_read_task");
    endtask

    task mem_read_task;
        $display("mem_read_task");
    endtask

    task io_read_task;
        $display("io_read_task");
    endtask

    initial begin
        for ( int i=0 ; i < 15 ; ++i) begin
            randsequence (stream)
                stream: cfg_read :=1 |
                        io_read :=2 |
                        mem_read :=5;

                cfg_read: { cfg_read_task; } |
                        { cfg_read_task; }  cfg_read;
                mem_read: { mem_read_task; } |
                        { mem_read_task; }  mem_read;
                io_read:  { io_read_task; }  |
                        { io_read_task; }   io_read;
            endsequence
        end
    end
endmodule

/*
Note:
    - Big advantage of using randsequence ==> it is procedural and can be debugged easily
    - Problems ==> the code to generate the sequence is not reusable

Output:
    mem_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    io_read_task
    io_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    io_read_task
    io_read_task
    cfg_read_task
    io_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    mem_read_task
    io_read_task
    io_read_task
    io_read_task
    mem_read_task
    mem_read_task
    cfg_read_task

*/