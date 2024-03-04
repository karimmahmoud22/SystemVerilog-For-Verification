/*
    purpose: This file contains example of good sum constraint
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top;
    class good_sum;
        rand int unsigned len [];
        constraint c_len {
            foreach(len[i])
                len[i] inside {[1:255]};
            len.sum() < 1024;
            len.size() inside {[1:8]};
        }
    endclass    

    good_sum s;

    initial begin
        s = new();
        repeat(10) begin
            assert (s.randomize()) 
            else $fatal("Randomization failed");
            $display("len = %0p", s.len);
        end
    end

endmodule

/*
Note:
    - Here every element of len is unsigned and has a value between 1 and 255
    - The sum of all elements of len is less than 1024
    - The only way to put constraint on every element of len is to use foreach
Output:
    len = '{'h96, 'h14} 
    len = '{'h78, 'h87} 
    len = '{'h15, 'hd9, 'h44, 'h1d, 'h4b} 
    len = '{'hb, 'h4, 'h6, 'h20, 'h73, 'h41, 'hdb} 
    len = '{'h8d, 'h9b} 
    len = '{'h8e, 'h82} 
    len = '{'hd2, 'hcd, 'hdc, 'h6f, 'h65, 'h4f, 'h3b, 'h3} 
    len = '{'hdd, 'h92} 
    len = '{'h57, 'hf5, 'h49, 'hf8, 'he7} 
    len = '{'h99, 'hff, 'h39} 

*/