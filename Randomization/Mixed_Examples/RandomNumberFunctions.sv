program test;
    int a;
    int seed= 655;

    // Seed controls the numbers that $random returns. 
    // The seed must be a reg, integer or time variable.
    /*
        Everytime you run the code it will generate the
        same random numbers as long as the seed is the same. So a good practice is to
        make the seed equals the computer time.
    */
    initial begin
        //Flat distribution, returns signed 32-bit random
        a = $random();
        $display("Random number = %0d", a);

        //Flat distribution, returns unsigned 32-bit random
        a = $urandom();
        $display("Random number = %0d", a);

        //Flat distribution over a range (min, max)
        a = $urandom_range(50, 100);
        $display("Random number = %0d", a);

        //Expontential decay (seed, mean)
        a = $dist_exponential(seed, 30);
        $display("Random number = %0d", a);

        //Bell-shaped distribution (seed, mean, std_dev)
        a = $dist_normal(seed, 30, 2);
        $display("Random number = %0d", a);

        //Bell-shaped distribution (seed, mean)
        a = $dist_poisson(seed, 30);
        $display("Random number = %0d", a);

        //Flat-shaped distribution (seed, start, end)
        a = $dist_uniform(seed, 10, 50);
        $display("Random number = %0d", a);
    
    end

endprogram

/*
Random number = 303379748
Random number = 98710838
Random number = 70
Random number = 137
Random number = 31
Random number = 42
Random number = 12
*/