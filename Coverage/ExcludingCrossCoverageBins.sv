covergroup CovKind;

    port: coverpoint tr.port {
        bins port[] = {[0:$]};
    }

    kind: coverpoint tr.kind {
        bins zer = {0};
        bins low = {[1:3]};
        bins high = {[8:$]};
        bins misc = default;
    }

    cross kind, port {
        ignore_bins hi = binsof(port) intersect {7};
        ignore_bins md = binsof(port) intersect {} &&
                         binsof(kind) intersect {[9:11]};
        
        ignore_bins lo = binsof(kind.lo);
    }

endgroup

/*

*/