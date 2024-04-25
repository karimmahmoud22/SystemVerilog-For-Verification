/*
    purpose: This file contains example of environment using mailbox
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Environment;

    Generator gen;
    Agent agt;
    Driver drv;
    Monitor mon;
    Checker chk;
    Scoreboard sb;
    config cfg;
    mailbox gen2agt, agt2drv, mon2chk;

    extern function new();
    extern function void gen_cfg();
    extern function void build();
    extern task run();
    extern task wrapup();
endclass

function Environment::new();
    
    // Initialize mailboxes
    gen2agt = new();
    agt2drv = new();
    mon2chk = new();

    // Initialize Transactors    
    gen = new( gen2agt );
    agt = new(gen2agt, agt2drv);
    drv = new(agt2drv);
    mon = new(mon2chk);
    chk = new(mon2chk);
    sb = new();
    cfg = new();
endfunction

function void Environment::gen_cfg();
    assert (cfg.randomize());
endfunction

task Environment::build();
    gen.build();
    agt.build();
    drv.build();
    mon.build();
    chk.build();
    sb.build();
endtask

task Environment::run();
    fork
        gen.run(run_for_n_transactions);
        agt.run();
        drv.run();
        mon.run();
        chk.run();
        sb.run(run_for_n_transactions);
    join
endtask

task Environment::wrapup();
    gen.wrapup();
    agt.wrapup();
    drv.wrapup();
    mon.wrapup();
    chk.wrapup();
    sb.wrapup();
endtask