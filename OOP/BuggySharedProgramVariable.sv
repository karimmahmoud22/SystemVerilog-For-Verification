/*
    purpose: This file contains exapmle of this keyword
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024

    ==> NOT WORKING
*/
program bug;

    class Buggy;
        int data[10];
        task transmit;
            fork
                // i is not declared here
                for( i=0 ; i<10; ++i )
                    send(data[i]);
            join_none
        endtask
    endclass

    // i is a program level
    int i;
    Buggy b;
    event receive;

    initial begin 
        b = new;
        for( i=0 ; i<10; ++i )
            b.data[i] = i;
        b.transmit;

        for ( i=0 ; i<10; ++i )
            @(receive) $display(b.data[i]);
    end
endprogram