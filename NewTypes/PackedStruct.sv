/*
    purpose: This file contains packed struct examples
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/


module packe_struct();

    // pixel here is stored in 3 long words
    // each long word is 32 bits
    /*  e.g:
        pixel.r = (0000 0000 0000 0000 0000 0000)=> always zeros ( waste of memory) & 1111 1111 ==> for r;
        pixel.g = (0000 0000 0000 0000 0000 0000)=> always zeros ( waste of memory) & 1111 1111 ==> for g;
        pixel.b = (0000 0000 0000 0000 0000 0000)=> always zeros ( waste of memory) & 1111 1111 ==> for b;
        
        ==> huge waste of memory
        ==> but simple to access each channel individually
    */
    typedef struct { bit [7:0] r, g, b; } pixel_t;
    pixel_t pixel;


    // pixel here is stored in 1 long word
    // each long word is 32 bits
    /*  e.g:
        pixel.r = 1111 1111 ==> for r;
        pixel.g = 1111 1111 ==> for g;
        pixel.b = 1111 1111 ==> for b;
        and 8 bits wasted
        ==> less waste of memory
        ==> but complex to access each channel individually
    */
    typedef struct packed { bit [7:0] r, g, b; } packed_pixel_t;
    packed_pixel_t packed_pixel;

endmodule