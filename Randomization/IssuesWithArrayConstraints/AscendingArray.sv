/*
    purpose: This file contains example of ascending array constraints
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

module top;
    class ascending_array;
        rand int unsigned data [10];
        constraint c_data {
            foreach(data[i])
                if (i != 0)
                    data[i] > data[i-1];
        }
    endclass    

    ascending_array s;

    initial begin
        s = new();
        repeat(10) begin
            assert (s.randomize()) 
            else $fatal("Randomization failed");
            $display("data = %0p", s.data);
        end
    end

endmodule

/*
Note:

Output:
    data = '{'hdbd4881, 'he9699e6, 'h2b17f6e8, 'h35ca58e4, 'h42f71467, 'h443b9484, 'h46f1f0e8, 'h55f59abf, 'hfdf419dd, 'hfeb2038d} 
    data = '{'h35e1a4c, 'h158543d0, 'h1d2c25c6, 'h1d2cb3e7, 'h1d349c16, 'h1d61b037, 'h316191a9, 'h38227fb5, 'h3dcdb3e0, 'hf0987fe6} 
    data = '{'hbcec75e, 'h50b7cde8, 'h694b1571, 'h9d9ec32b, 'had925220, 'hafc5b5a1, 'hcf4f2f79, 'hd74fc073, 'hfd81ebe4, 'hfe166db1} 
    data = '{'h16946112, 'h1a559476, 'h1f8165ae, 'h212a2efc, 'h257bda91, 'h3435e43f, 'h6e35515d, 'hc30ee886, 'hdac5b6ac, 'he14dea5e} 
    data = '{'h4f231, 'h1309b8, 'ha4392c1, 'hdf32cef, 'h10c21483, 'h18ea70c4, 'h24b6b97d, 'h383c8200, 'hc0f30e1f, 'hf8d244d6} 
    data = '{'h22b9f, 'h4a32c, 'h63565, 'h12c95fe, 'h66be502, 'h674cafb, 'h67a7bc1, 'h682c6c0, 'h69cbfe0, 'h2131b392} 
    data = '{'h67be564c, 'hb34b88df, 'hda562767, 'hf0722a47, 'hf0c3c28e, 'hf14e47bc, 'hf65ea9f5, 'hf66ca05f, 'hf8c5ace5, 'hfa9e91f9} 
    data = '{'h49682d, 'h76cbcf0, 'h1160a34d, 'h1db70b37, 'h1e1bbbec, 'h1e27b123, 'h343d3598, 'h38f4a082, 'h3a352449, 'h3c5831f7} 
    data = '{'h20fde032, 'h2556fd69, 'h26d5699e, 'h2b010f69, 'h43cc0af7, 'h58256602, 'h9b295f55, 'haddc8be4, 'hd9da9ab6, 'hf6c0a07d} 
    data = '{'h464336d6, 'h4daf340c, 'h5046e491, 'h50cd1a2f, 'h568238a3, 'h5fad57bc, 'had9b0190, 'hb6ef28e0, 'he1e87aac, 'he68d365f} 

*/