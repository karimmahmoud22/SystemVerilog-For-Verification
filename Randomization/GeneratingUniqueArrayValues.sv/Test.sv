/*
    purpose: This file contains example of testing unique array values
    Author: Karim Mahmoud Kamal
    Date:    27th of February 2024
*/

program automatic test;
    
    UniqueArray u;

    initial begin
        u = new(50);
        
        repeat(10) begin
            assert (u.randomize()) 
            else $fatal("Randomization failed");
            u.display();
        end
    end

endprogram

/*

Output:
    Size:  11   23   48   19   20   25   43   18   38   11    9    5
    Size:  13   12   10   19   11   27    1   26   43   33    6    5    3   42
    Size:  31   27   29   28   37   40   43   18   47   41   31    7   46    9   24    2    8    1   10   21   25   22   17   13   39   42   38   30    4   20   23   48
    Size:  39    4   48   42   26   29   49   46   34   27   25    9   22    5   23   44   39    6   18   28   31   12   33    1    3   17   19   14   20   36   13    2   40   32   16   45    7   24   21   38
    Size:  11   38   49    3   17   24    0   12   26   32   20   44
    Size:   7    4   47   27   15   42   21    2
    Size:  48    4   10   26   37    2   44    3   15   20   34   33    1   42   40   47   27   25   18    6    5   43   32   16   23   11   29   12   46   14    7   30   39   48   49   41   35    0   31   38   45   36   13   19   24    9    8   28   17
    Size:  12   24   36   39    3   41    9   29   17   22   30   48   23
    Size:  31   21   24   39   41   37   18   22   34   27   13    5   33   10   25   46   49   48    6    2    1   35   44   31   38   19   12    3   43   36   23    7
    Size:  14   15   10   41   46   45   44   22   49   19   31   29    6   28   23

*/