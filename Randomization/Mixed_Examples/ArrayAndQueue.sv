class good;

    rand int len [];
    constraint c1 { 
        foreach (  len[i] )
            len[i] inside {[1:255]};
            len.sum() < 1024;
            len.size() inside {[1:8]};
    }

endclass

program test;

    good a;

    initial begin
        a = new();
        for ( int i= 1; i <= 10; i++ ) begin
            assert(a.randomize());
            $display("Sum = %0d,Size = %0d, Array = %s", a.len.sum(), a.len.size(), a.len);
        end
    end

endprogram

/*
Sum = 170,Size = 2, Array = '{150, 20} 
Sum = 255,Size = 2, Array = '{120, 135} 
Sum = 410,Size = 5, Array = '{21, 217, 68, 29, 75} 
Sum = 452,Size = 7, Array = '{11, 4, 6, 32, 115, 65, 219} 
Sum = 296,Size = 2, Array = '{141, 155} 
Sum = 272,Size = 2, Array = '{142, 130} 
Sum = 988,Size = 8, Array = '{210, 205, 220, 111, 101, 79, 59, 3} 
Sum = 367,Size = 2, Array = '{221, 146} 
Sum = 884,Size = 5, Array = '{87, 245, 73, 248, 231} 
Sum = 465,Size = 3, Array = '{153, 255, 57} 
*/