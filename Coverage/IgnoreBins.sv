covergroup CovKind;

    CP1: coverpoint tr.i
    {
        options.auto_bin_max = 4;       // 0:1, 2:3, 4:5, 6:7
        ignore_bins even = {[6:7]};
    }

endgroup

/*

*/