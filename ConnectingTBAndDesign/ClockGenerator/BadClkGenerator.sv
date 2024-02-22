/*
    purpose: This file contains example of clock generator using program
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/

//BAD CLOCK GENERATOR
program automatic clk_generator( output bit clk , out_sig );

    clk=0;
    initial
        forever #5 clk = ~clk;

    initial
        forever @(posedge clk)
            out_sig <=  ~out_sig;
endprogram

/*
    Bad clock generator:
        Program is not used for clock generation
        Module is the right place for clock generation
        As design executed in the active region and program( for TB ) is executed in the reactive region
*/



