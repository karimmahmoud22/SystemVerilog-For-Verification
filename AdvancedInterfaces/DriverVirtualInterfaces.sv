/*
    purpose: This file contains example of a driver class that is used to drive the ATM cells to the DUT.
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/

class Driver;

    virtual X_if xi;
    int id;

    function new(virtual X_if.TB xi, int id);
        this.xi = xi;
        this.id = id;
    endfunction
    
    task reset;
        fork
            begin
                $display("@%0d: %m: Start reset [%0d]", $time, id);
                // Reset the device
                xi.reset_l <= 1;
                xi.cb.load <= 0;
                xi.cb.din <= 0;
                @(xi.cb)
                xi.reset_l <= 0;
                @(xi.cb)
                xi.reset_l <= 1;
                $display("@%0d: %m: End reset [%0d]", $time, id);
            end
       join_none
    endtask
    
    task load;
        fork
            begin
                $display("@%0d: %m: Start load [%0d]", $time, id);
                ##1 xi.cb.load <= 1;
                xi.cb.din <= id + 10;
                ##1 xi.cb.load <= 0;
                repeat (5) 
                    @(xi.cb);
                $display("@%0d: %m: End load [%0d]", $time, id);
            end
        join_none
    endtask
endclass
