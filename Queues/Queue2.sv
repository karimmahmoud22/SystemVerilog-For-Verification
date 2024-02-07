/*
    purpose: This file contains some basic operations on a queue
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module queue2();

    int i = 7;
    int temp;
    int q1[$] = {3,4};
    int q2[$] = {2,4,6,8,10};

    initial begin

        // Note about $
        // if $ is used at left [$:2] means [0:2]
        // if $ is used at right [2:$] means [2:till end]        
        q1 = {q1[$:1] , 8};
        $display("q1 = %p",q1);

        // eqivalent to insert(1,7)
        q2 = { q2[0] , i , q2[1:$] };
        $display("q2 = %p",q2);

        // insert a queue into another queue
        q2 = { q2[0:2] , q1 , q2[3:$]};
        $display("q2 = %p",q2);

        // eqivalent to push_front(7)
        q2 = { 7 , q2 };
        $display("q2 = %p",q2);

        // eqivalent to push_back(7)
        q2 = { q2 , 7 };
        $display("q2 = %p",q2);

        // eqivalent to pop_back()
        temp = q2[$];
        q2 = q2[0:$-1];
        $display("q2 = %p",q2);
        $display("temp = %0d",temp);

        // eqivalent to pob_front()
        temp = q2[0];
        q2 = q2[1:$];
        $display("q2 = %p",q2);
        $display("temp = %0d",temp);

        // eqivalent to delete()
        q2 = {};
        $display("q2 = %p",q2);
        
    end

endmodule