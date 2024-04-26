/*
    purpose: This file contains example of a typedef with virtual interface
    Author: Karim Mahmoud Kamal
    Date:    26th of April 2024
*/

typedef virtual X_if.TB vX_t;

program automatic test;
    vX_t vxi[NUM_XI]; // Virtual interface array
    Driver driver[];
endprogram

class Driver;
    vX_t xi;
    int id;
    function new(vX_t xi, int id);
        this.xi = xi;
        this.id = id;
    endfunction
endclass // Driver