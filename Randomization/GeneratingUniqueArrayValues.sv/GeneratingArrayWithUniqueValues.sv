/*
    purpose: This file contains example of generating array with unique values
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

class UniqueArray;
    int max_array_size, max_value;
    rand bit [7:0] a [];
    
    constraint c_size{
        a.size() inside {[1:max_array_size]};
    }

    function new(int max_array_size=2 , max_value=1);
        this.max_array_size = max_array_size;
        if ( max_array_size > max_value)
            this.max_value = max_array_size;
        else
            this.max_value = max_value;
    endfunction

    // At this point the array is allocated, fill with unique values
    function void post_randomize();
        RandcRange rr;
        rr = new ( max_value );
        foreach(a[i]) begin
            assert( rr.randomize() );
            a[i] = rr.value;
        end
    endfunction

    function void display();
        $write("Size: %3d", a.size());
        foreach(a[i]) begin
            $write(" %4d", a[i]);
        end
        $display;
    endfunction
endclass    


