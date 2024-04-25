class Transaction;

    rand bit [2:0] hdr_len;
    rand bit [3:0] payload_len;
    rand bit [4:0] len;
    constraint c1 { len == hdr_len + payload_len; }         // NOT EVENLY WEIGHTED

    //BEST TO DO:
    constraint sb { solve len before hdr_len, payload_len; }              // EVENLY WEIGHTED
endclass