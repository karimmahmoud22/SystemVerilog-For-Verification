covergroup CovKind;

    CP1: coverpoint tr.i
    {
        illegal_bins even = {6,7};
    }

endgroup

/*
illegal bins are used to specify the bins that are not allowed to be covered.
if happen, error will be generated.
*/