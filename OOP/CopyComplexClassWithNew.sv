/*
    purpose: This file contains exapmle of copy complex class 
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module copy_complex_class();

    typedef class Statistics;       //Define lower level class

    class BusTran;
        bit [31:0] addr, crc, data[8];
        static int count=0;
        int id;
        Statistics stats;           // Statistics handle

        function new();
            stats = new();          // make instance of stats
            id = count++;
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

        BusTran src, dst;
        src = new();
        src.stats.startT = 42;
        $display("src.stats.startT = %0d", src.stats.startT);
        // The following line ==>  error 
        // $display("dst.stats.startT = %0d", dst.stats.startT);
        dst = new src;
        dst.stats.startT = 84;
        // The 2 objects will have the same pointer ( ointing to same object and any effect of one will afferc the other )
        // We copy the BusTrans object so there are 2 objects of BusTran ( original and copy ) but both will point to same object of Statistics 
        $display("src.stats.startT = %0d", src.stats.startT);
        $display("dst.stats.startT = %0d", dst.stats.startT);
    end

endmodule