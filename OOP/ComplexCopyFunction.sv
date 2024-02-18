/*
    purpose: This file contains exapmle of using class inside another one
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module using_class_inside_another();

    typedef class Statistics;       //Define lower level class

    class BusTran;
        bit [31:0] addr, crc, data[8];
        Statistics stats;           // Statistics handle
        static int count=0;
        int id;

        function new();
            stats = new();          // make instance of stats
            id = count++;
        endfunction

        function BusTran copy();
            copy = new();
            copy.addr = this.addr;
            copy.crc = this.crc;
            copy.data = this.data;
            copy.stats = this.stats.copy();
            id = count++;
        endfunction 
    endclass

    // ---------------------------------------------------------------------------------

    class Statistics;

        time startT, stopT;          //Transaction Time
        static int ntrans = 0;
        static time total_elapsed_time =0;

        function Statistics copy();
            copy = new();
            copy.startT = this.startT;
            copy.stopT = this.stopT;
            copy.ntrans = this.ntrans;
            copy.total_elapsed_time = this.total_elapsed_time;
        endfunction 

    endclass

    // ---------------------------------------------------------------------------------

    initial begin

        BusTran a, b;
        a = new();
        b = new a;
    end

endmodule