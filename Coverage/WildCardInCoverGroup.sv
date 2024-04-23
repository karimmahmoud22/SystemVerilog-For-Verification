covergroup CovKind;

    CP1: coverpoint tr.i
    {
        wildcard bins even = {4'bxzx0};
        wildcard bins odd = {4'b???1};
    }

endgroup

/*

wild card is used if you care about some bits only and not all bits in the coverpoint.
In the above example, we are interested in the last bit of the coverpoint.

*/