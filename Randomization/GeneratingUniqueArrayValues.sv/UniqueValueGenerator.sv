/*
    purpose: This file contains example of generating unique values
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

class RandcRange;
    randc bit [15:0] value;
    int max_value;

    function new(int max_value=10);
        this.max_value = max_value;
    endfunction

    constraint c_max_value{
        value < max_value;
    }
endclass    
