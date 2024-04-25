/*
    purpose: This file contains example of best alternative to inheritance and composition in C++.
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class ethernet_mac_frame;

    typedef enum { IT, IEEE} kind_t;
    rand kind_t kind;
    rand bit [47:0] dest, src;
    rand bit [15:0] len, vlan;

    constarint eth_mac_frame_IT {
        if ( kind == IT ) {
            data.size() inside {[46:1500]};
            len == data.size();
        }
    }

    constarint eth_mac_frame_IEEE {
        if ( kind == IEEE ) {
            data.size() inside {[46:1500]};
            len < 1522;
        }
    }

endclass

/*
output: 
*/