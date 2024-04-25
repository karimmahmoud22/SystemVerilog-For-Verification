/*
Notes:
    1- Argument type is sticky w.r.t the previous argument
    2- The default type for the first argument is a single-bit input
    3- There are 3 types of arguments: input, output, ref

    examples:
    
    // here b will be same as a ( input and int)
    task sticky ( int a,b);

    // here a & b will be ref as arr && a and b will be int
    task sticky ( ref int arr [50], int a, b);

    // here a & b are input int 
    task sticky ( ref int arr [50], input int a, b);
*/