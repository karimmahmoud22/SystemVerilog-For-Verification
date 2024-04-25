/*
    purpose: This file contains example of inheritance in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Transaction;

    randc bit [31:0] src, dst, data[8];
    bit [31:0] crc;

    virtual function void crc_calculate();
        crc = src ^ dst ^ data.xor();
    endfunction

    virtual function void display();
        $display("Transaction: src=%0d, dst=%0d, crc=%0d", src, dst, crc);
    endfunction

endclass

class BadTr extends Transaction;

    rand bit bad_crc;
    virtual function void crc_calculate();
        super.crc_calculate();
        if ( bad_crc ) begin
            crc = ~crc;
        end

    endfunction
    
    virtual function void display();
        $write("BadTr: bad_crc=%0b, ", bad_crc);
        super.display();
    endfunction

endclass

program automatic test;

    Transaction tr;
    BadTr btr;

    initial begin
        tr = new();
        btr = new();
        tr.randomize();
        btr.randomize();
        tr.crc_calculate();
        btr.crc_calculate();
        tr.display();
        btr.display();
    end

    initial begin

        // make base handle = extended object ==> no special handling
        btr = new();
        btr.randomize();
        btr.crc_calculate();
        btr.display();
        tr = btr;
        tr.display();

    end

    initial begin

        // make base handle = extended object ==> no special handling
        tr = new();
        tr.randomize();
        tr.crc_calculate();
        tr.display();

        // btr = tr;   ==> ERROR: cannot assign base handle to extended object

        if ( !$cast( btr, tr ) ) begin
            $display("Cannot cast base handle to extended object");
        end

        btr.display();

    end


endprogram

/*
output: 
    Transaction: src=3910850489, dst=2704996519, crc=1222697166
    BadTr: bad_crc=0, Transaction: src=2735842055, dst=83671180, crc=273072135

    BadTr: bad_crc=1, Transaction: src=2053173825, dst=2784303589, crc=3018603779
    BadTr: bad_crc=1, Transaction: src=2053173825, dst=2784303589, crc=3018603779 ==> here is display of tr.display() after casting tr = btr

    Transaction: src=2156422272, dst=1874697416, crc=2614405678
    Cannot cast base handle to extended object
    BadTr: bad_crc=1, Transaction: src=2053173825, dst=2784303589, crc=3018603779

*/