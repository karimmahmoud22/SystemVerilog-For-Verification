program test;
    class Packet;

        //The random variables
        rand bit [31:0] src, dst, data[8];
        randc bit [7:0] kind;

        //Limit the values of src
        constraint src_c {  src > 10;
                            src < 15; }

    endclass

    Packet pkt;

    initial begin
        //Create a new packet
        pkt = new();

        //Randomize the packet
        assert(pkt.randomize())
        else $fatal(0, "Randomization failed");
        //Print the values
        $display("%p", pkt);
    end

endprogram
