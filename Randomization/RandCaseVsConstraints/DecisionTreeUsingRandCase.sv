/*
    purpose: This file contains example of decision tree using randcase
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;    

    initial begin
        //Level 1
        randcase
            one_write_wt: do_one_write();
            one_read_wt: do_one_read();
            seq_write_wt: do_seq_write();
            seq_read_wt: do_seq_read(); 
        endcase

        //Level 2
        task do_one_write();
            randcase
                mem_write_wt: do_mem_write();
                io_write_wt: do_io_write();
                cfg_write_wt: do_cfg_write();
            endcase
        endtask

        task do_one_read();
            randcase
                mem_read_wt: do_mem_read();
                io_read_wt: do_io_read();
                cfg_read_wt: do_cfg_read();
            endcase
        endtask

        task do_seq_write();
            randcase
                mem_seq_write_wt: do_mem_seq_write();
                io_seq_write_wt: do_io_seq_write();
                cfg_seq_write_wt: do_cfg_seq_write();
            endcase
        endtask

        task do_seq_read();
            randcase
                mem_seq_read_wt: do_mem_seq_read();
                io_seq_read_wt: do_io_seq_read();
                cfg_seq_read_wt: do_cfg_seq_read();
            endcase
        endtask

        

    end

endmodule

/*
Note:

Output:
  
*/