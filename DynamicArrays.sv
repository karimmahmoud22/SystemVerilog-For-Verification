/*
    purpose: This file contains examples on dynamic arrays
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module dynamic_arrays();

    // dynamic arrays: size is not specified.
    int dyn[], d2[];

    initial begin
        //Allocate 6 places in the array
        dyn = new[6];

        foreach (dyn[i]) begin
            dyn[i] = i;
        end

        // print the array
        $display(dyn);

        // copy the array dyn into d2
        d2 = dyn;
        d2[0] = 5;

        $display(dyn,d2);

        // This will allocate 20 new places and remove the previous elements
        //dyn = new [20];

        //This will allocate new places and copy previous ones and left the rest as default value(0)
        dyn = new[20] (dyn);

        $display(dyn);
        $display("Size of dyn = %0d", $size(dyn));

        //delete the allocation of dynmic array
        dyn.delete();

        $display(dyn);
    end

endmodule