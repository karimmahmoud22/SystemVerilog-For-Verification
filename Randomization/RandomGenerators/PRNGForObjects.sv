/*
    purpose: This file contains example of simple pseudo random generator
    Author: Karim Mahmoud Kamal
    Date:    4th of March 2024
*/

class Gen1;
    Transaction tra, trb;

    forever @(int1.cb)
        tra.randomize()
        trb.randomize()

endclass

class Gen2;
    Transaction tr1, tr2;

    forever @(int2.cb)
        tr1.randomize()
        tr2.randomize()

endclass

/*
Note:
    - In SystemVerilog, there is a separate PRNG for every object and thread
    - Changes to one object do not affect the random numbers seen by other objects
  
*/