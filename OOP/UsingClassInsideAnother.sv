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

        function new();
            stats = new();          // make instance of stats
        endfunction

        extern task create_packet();

    endclass

    // ---------------------------------------------------------------------------------

    task BusTran::create_packet();
        //Fill packet with data ==> assume it takes 10ns
        #10;
        stats.start();
        //Transmit packet ==> assume it takes 10ns
        #10;
        stats.stop();
        stats.how_long();
        stats.display_info();
    endtask

    // ---------------------------------------------------------------------------------

    class Statistics;

        time startT, stopT;          //Transaction Time
        static int ntrans = 0;
        static time total_elapsed_time =0;

        extern function time how_long();
        extern function void start();
        extern function void stop();
        extern function void display_info();
    endclass

    // ---------------------------------------------------------------------------------

    function time Statistics::how_long();
        how_long = stopT - startT;
        ++ntrans;
        total_elapsed_time += how_long;
    endfunction

    function void Statistics::start();
        startT = $time;
    endfunction

    function void Statistics::stop();
        stopT = $time;
    endfunction

    function void Statistics::display_info();
        $display("The number of transactions till now is: %0d", this.ntrans);
        $display("The total elapsed time is: %0d", this.total_elapsed_time);
    endfunction

    // ---------------------------------------------------------------------------------

    initial begin

        BusTran b;
        b = new();
        b.create_packet();
    end

endmodule