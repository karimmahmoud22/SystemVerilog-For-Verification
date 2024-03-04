/*
    purpose: This file contains example of fork join none
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

module top;

    initial begin
        $display("@%0t: start fork...join_none", $time);
        #10 $display("@%0t: sequential after #10", $time);
        fork
            $display("@%0t: parallel start", $time);
            #50 $display("@%0t: parallel after #50", $time);
            #10 $display("@%0t: parallel after #10", $time);

            begin
                #30 $display("@%0t: sequential block 1 after #30", $time);
                #10 $display("@%0t: sequential block 1 after #10", $time);
            end
        join_none        
        
        $display("@%0t: end of fork...join_none", $time);
        #80 $display("@%0t: final after #80", $time);
    end
endmodule


/*
Note:
  
Output:
    @0: start fork...join_none
    @10: sequential after #10
    @10: end of fork...join_none
    @10: parallel start
    @20: parallel after #10
    @40: sequential block 1 after #30
    @50: sequential block 1 after #10
    @60: parallel after #50
    @90: final after #80

*/