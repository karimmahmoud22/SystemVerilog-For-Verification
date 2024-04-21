program automatic fetch_test ( fetch_interface fetch_int, fetch_interface fetch_int_monitor );

    initial begin
        control_e cntrl;
        $timeformat(-9, 0, " ns", 5);

        // Keep an eye on: program_counter, next_program_counter, read, state
        $monitor("Time: %t, PC: %h, NPC: %h, Read: %b, State: %d", $time, fetch_int_monitor.fetch_cb_monitor.program_counter
                                                                        , fetch_int_monitor.fetch_cb_monitor.next_program_counter
                                                                        , fetch_int_monitor.fetch_cb_monitor.read
                                                                        , fetch_int_monitor.fetch_cb_monitor.state);

        // Reset the DUT
        $display("%t: Resetting DUT", $time);
        fetch_int.reset <= 1'b1;
        fetch_int.fetch_cb.target_address <= 16'hFFFC;
        fetch_int.fetch_cb.branch_taken <= 1'b0;
        fetch_int.fetch_cb.state <= CNTRL_UPDATE_PC;

        // Make sure pc is reset to 16'h3000
        repeat(2) @(fetch_int.fetch_cb);    //@30ns
        program_counter_post_reset: assert ( fetch_int.fetch_cb.program_counter == 16'h3000 ) 
                                    else $fatal("PC not reset to 16'h3000");

        //Remove reset for normal operation @50ns
        ##1 fetch_int.fetch_cb.reset <= 1'b0; //synchronous operation

        // Make sure that brach happens when branch_taken is high
        @(fetch_int.fetch_cb)
        $display("\n%t: Test loading of target address", $realtime);
        fetch_int.fetch_cb.state <= CNTRL_UPDATE_PC;
        fetch_int.fetch_cb.branch_taken <= 1'b1;
        repeat(2) @(fetch_int.fetch_cb);
        program_counter_branch_taken: assert ( fetch_int.fetch_cb.program_counter == 16'hFFFC ) 
                                    else $fatal("Branch not taken");

        // Make sure that PC is incremented to 16'h0000 after 5 cycles
        $display("\n%t: Did the PC rollover as expected? ", $realtime);
        fetch_int.fetch_cb.branch_taken <= 1'b0;
        fetch_int.fetch_cb.state <= CNTRL_UPDATE_PC;
        repeat(5) @(fetch_int.fetch_cb);
        program_counter_rollover: assert ( fetch_int.fetch_cb.program_counter == 16'h0000 ) 
                                    else $fatal("PC did not rollover as expected");
        
        //Try controller states from 1 to 6
        $display("\n%t: Testing controller states", $realtime);
        for ( int i= CNTRL_FETCH ; i <= CNTRL_COMPUTE_MEM ; ++i ) begin
            $cast(cntrl, i);
            if ( cntrl == CNTRL_UPDATE_PC ) 
                continue;
            $display("\n%t: Testing controller state: %s", $realtime, cntrl.name);
            fetch_int.fetch_cb.branch_taken <= 1'b0;
            fetch_int.fetch_cb.state <= cntrl;

            // Make sure that PC is not updated
            repeat(2) @(fetch_int.fetch_cb);
            program_counter_no_load: assert ( fetch_int.fetch_cb.program_counter == 16'h0001 ) 
                                     else $fatal("PC updated when it should not have been");
        end

        $display("\n%t: Tristate on PC output", $realtime);

        // Make sure pc is zzzz beacuse state is CNTRL_READ_MEM 
        fetch_int.fetch_cb.state <= CNTRL_READ_MEM;
        @(fetch_int.fetch_cb);
        // Note: == will make assertion fire but === will not
        program_counter_zzzz1: assert ( fetch_int.fetch_cb.program_counter === 16'hZZZZ ) 
                              else $fatal("PC not tristated");

        // Make sure pc is zzzz beacuse state is CNTRL_IND_ADDR_RD
        fetch_int.fetch_cb.state <= CNTRL_IND_ADDR_RD;
        @(fetch_int.fetch_cb);
        // Note: == will make assertion fire but === will not
        program_counter_zzzz2: assert ( fetch_int.fetch_cb.program_counter === 16'hZZZZ ) 
                              else $fatal("PC not tristated");

        // Make sure pc is zzzz beacuse state is CNTRL_WRITE_MEM
        fetch_int.fetch_cb.state <= CNTRL_WRITE_MEM;
        @(fetch_int.fetch_cb);
        // Note: == will make assertion fire but === will not
        program_counter_zzzz3: assert ( fetch_int.fetch_cb.program_counter === 16'hZZZZ ) 
                              else $fatal("PC not tristated");
    end

endprogram