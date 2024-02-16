/*
    purpose: This file contains static variable example
    Author: Karim Mahmoud Kamal
    Date:    15th of February 2024
*/

class BusTran;

    // number of objects created
    static int count = 0;
    int id;


    function new ();
        id = count++;       // Set id for each object created and increment count
    endfunction: new

endclass: BusTran

module first_class();
    initial begin

        BusTran b1, b2, b3;
        b1 = new();
        b2 = new();
        $display("Bus1 id: %0d, Bus2 id: %0d", b1.id, b2.id);
        $display("Number of objects created: %0d", b2.count);

        // The following line will produce an error as b3 is not allocated
        // $display("Number of objects created: %0d", b3.count);

        b3 = new();
        $display("Bus1 id: %0d, Bus2 id: %0d, Bus3 id: %0d", b1.id, b2.id, b3.id);
        $display("Number of objects created: %0d", b3.count);
    end
endmodule: first_class

