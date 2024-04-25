class Transaction;
    randc bit a,b;
endclass

// This technique is used if we already have bins defined for the individual coverpoints and we want to define a cross coverage between them.
covergroup CrossBinNames;
    option.per_instance = 1;
    a_cg : coverpoint tr.a {
        bins a0 = {0};
        bins a1 = {1};
        option.weight = 0;
    }
    b_cg : coverpoint tr.b {
        bins b0 = {0};
        bins b1 = {1};
        option.weight = 0;
    }
    ab: cross a_cg, b_cg {
        bins a0_b0 = binsof(a_cg.a0) intersect binsof(b_cg.b0);
        bins a1_b0 = binsof(a_cg.a1) intersect binsof(b_cg.b0);
        bins b0 = binsof(b_cg.b0);
    }
endgroup

/////////////////////////////////////

// This technique is used if we need to build cross coverage bins but have no predefined bins for the individual coverpoints.
covergroup CrossBinsOfIntersect;
    a: coverpoint tr.a {
        option.weight = 0;
    }
    b: coverpoint tr.b {
        option.weight = 0;
    }
    ab: cross a, b {
        bins a0_b0 =    binsof(a) intersect {0} &&
                        binsof(b) intersect {0};
        bins a1_b0 =    binsof(a) intersect {1} &&
                        binsof(b) intersect {0};
        bins b1     =   binsof(b) intersect {1};
    }

endgroup

/////////////////////////////////

// This technique is used if we want tersest format for defining cross coverage bins.
covergroup CrossManula;
    ab: coverpoint {tr.a, tr.b} {
        bins a0_b0 =    {2'b00};
        bins a1_b0 =    {2'b10};
        wildcard bins b1     =   {2'b?1};
    }

endgroup