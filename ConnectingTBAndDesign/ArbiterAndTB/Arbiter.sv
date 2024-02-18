/*
    purpose: This file contains exapmle arbiter module
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module arbiter( grant , request , rst , clk );

    input logic rst , clk ;
    input logic [1:0] request ;
    output logic [1:0] grant ;

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0 || request == 2'b00)
            grant <= 2'b00;
        else if ( request == 2'b10 || request == 2'b11 ) 
           grant <= 2'b10;
        else if ( request == 2'b01 )
            grant <= 2'b01;
        else
            grant <= 2'bzz;
    end

endmodule