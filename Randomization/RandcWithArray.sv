/*
    purpose: This file contains example of Randc with array
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module randc_with_array();

    class RandcWithArray;
        int array [];
        randc bit [15:0] index;

        function new ( input int array []);
            this.array = array;
        endfunction

        function int pick();
            return array[index];
        endfunction

        constraint c_size {
            index < array.size();
        }

    endclass

    RandcWithArray rwa;

    initial begin
        rwa = new( '{1, 2, 3, 4, 5, 6, 7, 8, 9, 10} );
        repeat( rwa.array.size() ) begin
            assert( rwa.randomize() );
            $display("Random number is %0d", rwa.pick());
        end

    end
endmodule