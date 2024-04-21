class Weighted;

    rand int src, dst;
    constraint c_dist {
        src dist { 0:=40, [1:3]:=60};
        // 40+60+60+60 = 220
        // src 0, weight 40/220
        // src 1, weight 60/220
        // src 2, weight 60/220
        // src 3, weight 60/220

        dst dist { 0:/40, [1:3]:/60};
        // 40+60 = 100
        // dst 0, weight 40/100
        // dst 1, weight 20/100
        // dst 2, weight 20/100
        // dst 3, weight 20/100
    }

endclass

program test;

    Weighted w;

    initial begin
        w = new();
        for (int i = 0; i <= 10; i++) begin
            assert(w.randomize())
            else $fatal(0, "Randomization failed");
            $display("%p", w);
        end
    end

endprogram

/*
'{src:1, dst:3}
'{src:1, dst:1}
'{src:2, dst:3}
'{src:3, dst:2}
'{src:1, dst:2}
'{src:1, dst:0}
'{src:3, dst:0}
'{src:0, dst:0}
'{src:2, dst:0}
'{src:1, dst:2}
'{src:0, dst:1}
*/