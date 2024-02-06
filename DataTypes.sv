/*
    purpose: This package contains the data types used in the project.
    Author:  Karim Mahmoud Kamal
    Date:    6th of February 2024
*/
module data_types;
    
    /*

    Notes: 

        1- The 4 state types are: 0, 1, x, z
            ==> 0: variable/net is at 0 volts
            ==> 1: variable/net is at some value > 0.7 volts
            ==> x or X: variable/net is at an unknown value either 0 or 1
            ==> z or Z: variable/net is at a high impedance state ( may be is not connected to anything and is floating )

        2- The 2 state types are: 0, 1
            ==> 0: variable/net is at 0 volts
            ==> 1: variable/net is at some value > 0.7 volts

    */


    /* ----------------------------- SystemVerilog Types ----------------------------- */

    /* ----------------------------- Verilog Types ----------------------------- */
    // regiseters
    // ==> it is a 4 state type 
    // ==> no. of bits is >= 1
    // ==> unsigned 
    reg reg_1;

    // wire
    // ==> it is a 4 state type
    // ==> no. of bits is >= 1
    // ==> unsigned
    wire wire_1;

    // integer
    // ==> it is a 4 state type
    // ==> no. of bits is 32
    // ==> signed
    integer int_11;

    // int
    // ==> it is a 2 state type
    // ==> no. of bits is 32
    // ==> signed
    int int_1;

    // unsigned int 
    // ==> it is a 2 state type
    // ==> no. of bits is 32
    // ==> unsigned
    int unsigned uint_1;

    // real, time, and realtime
    real real_1;
    time time_1;
    realtime realtime_1;

    /* ----------------------------- End of Verilog Types ----------------------------- */    

    // logic
    // ==> it is a 4 state type
    // ==> no. of bits is >= 1
    // ==> unsigned
    logic logic_1;

    // bit
    // ==> it is a 2 state type
    // ==> no. of bits is >= 1
    // ==> unsigned
    bit bit_1;

    // byte
    // ==> it is a 2 state type
    // ==> no. of bits is 8
    // ==> signed
    byte byte_1;

    // shortint
    // ==> it is a 2 state type
    // ==> no. of bits is 16
    // ==> signed
    shortint shortint_1;

    // int
    // ==> it is a 2 state type
    // ==> no. of bits is 32
    // ==> signed
    int int_2;

    // longint
    // ==> it is a 2 state type
    // ==> no. of bits is 64
    // ==> signed
    longint longint_1;

    // shortreal
    shortreal shortreal_1;

    /* ----------------------------- End of SystemVerilog Types ----------------------------- */    

    // Example:

    bit b;              // 2-state, single-bit
    bit [31:0] b_32;    // 2-state, 32-bit unsigned integer

    byte b_8;            // 2-state, 8-bit signed integer
    shortint si;        // 2-state, 16-bit signed integer
    int i;              // 2-state, 32-bit signed integer
    int unsigned ui;    // 2-state, 32-bit unsigned integer 
    longint li;         // 2-state, 64-bit signed integer

    integer int_3;      // 4-state, 32-bit signed integer
    time t;             // 4-state, 64-bit unsigned integer
    real r;             // 4-state, 64-bit floating point


    initial begin
        #20;
        b <= 1;

        // x and z will be 0 as it is a 2-state type
        b_32 <= 32'hA5BFx1z7;

        // 30 is in binary 00011110
        // the second complement of 30 is 11100010 ==> in hex it is E2
        b_8 <= -30;

        // 80000 in binary is 1 0011 1000 1000 0000
        // si is a 16-bit signed integer so will take the least significant 16 bits
        // so si will be 0011 1000 1000 0000 ==> in hex it is 3880
        si <= 80000;

        // 5 is in binary 0000 0101
        // the second complement of 5 is 1111 1011 ==> in hex it is FB
        // i is a 32-bit signed integer so will be ffff ff fb in hex
        i <= -5;

        // 40 is in hex 28
        // ui is a 32-bit unsigned integer so will be 0000 0028 in hex
        ui <= 40;

        // 655168 in hex is 0000 0000 0000 0009 ff40
        li <= 655168;
        
        // 1010 ==> a in hex
        // zzzz ==> z in hex
        // 1000 ==> 8 in hex
        // xxxx ==> x in hex
        // the 4 digitas from left is unknown so it will be x as it is a 4-state type
        int_3 <= 32'bxxxx_1000_zzzz_1010;
        
        // it is a 64-bit unsigned integer so it will be ABCDEF5234123897
        t <= 64'hABCDEF5234123897;

        // it is a 64-bit floating point so it will be 3.14
        r <= 3.14;

    end
endmodule