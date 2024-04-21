interface fetch_interface ( input bit clk );

    logic reset, branch_taken, read;
    logic [15:0] target_address;
    control_e state;                // defined in top module
    logic [15:0] program_counter, next_program_counter;

    clocking fetch_cb @ (posedge clk);
        input read, program_counter, next_program_counter;
        output target_address, branch_taken, state, reset;
    endclocking

    // For monitoring DUT signals
    clocking fetch_cb_monitor @ (posedge clk);
        input read, program_counter, next_program_counter, target_address, branch_taken, state;
    endclocking


    modport fetch_tb( clocking fetch_cb, output reset );
    modport fetch_dut ( input clk, reset, branch_taken, target_address, state, output program_counter, next_program_counter, read);

    modport fetch_monitor( clocking fetch_cb_monitor );
endinterface