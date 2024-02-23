/*
    purpose: This file contains exapmle of interface
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

interface arb_int( input bit clk );
    logic [1:0] request, grant;
    logic rst;

    property request_2state;
        @(posedge clk) disable iff (rst);
        $isunknown(request) == 0;
    endproperty
    assert_request_2state: assert property request_2state
endinterface
