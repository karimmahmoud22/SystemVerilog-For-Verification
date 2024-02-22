/*
    purpose: This file contains exapmle arbiter module
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module arbiter( arb_int a );

    always @(posedge a.clk or negedge a.rst) begin
        if (a.rst == 1'b0 || a.request == 2'b00)
            a.grant = 2'b00;
        else if ( a.request == 2'b10 || a.request == 2'b11 ) 
           a.grant = 2'b10;
        else if ( a.request == 2'b01 )
            a.grant = 2'b01;
        else
            a.grant = 2'bzz;
    end

endmodule


// Module ==> Here we can use blocking or non-blocking assignments as we use interface