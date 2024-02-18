/*
    purpose: This file contains exapmle of passing objects to routines
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/
task generator();
    BusTran b;
    b = new;
    transmit(b);
endtask

task transmit( BusTran b);
    $display("Tranmiting");
endtask
