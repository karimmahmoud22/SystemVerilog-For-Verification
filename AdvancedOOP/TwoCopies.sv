/*
    purpose: This file contains example of inheritance in SystemVerilog
    Author: Karim Mahmoud Kamal
    Date:    25th of April 2024
*/

class Transaction;

    randc bit [31:0] src, dst, data[8];
    bit [31:0] crc;

    virtual function Transaction copy_data( Transaction copy);
        copy.src = src;
        copy.dst = dst;
        copy.data = data;
        copy.crc = crc;
    endfunction

    virtual function Transaction copy( Transaction copy);
        if ( copy == null ) begin
            this.copy = new();
        end
        else begin
            this.copy = copy;
        end
        copy_data(this.copy);
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

    virtual function void copy_data ( Transaction t );
        BadTr bt;
        super.copy_data(t);
        $cast(bt, t);
        bt.bad_crc = bad_crc;
    endfunction

    virtual function BadTr copy();
        BadTr copy;
        copy = new();
        copy_data(copy);
        return copy;
    endfunction

endclass
