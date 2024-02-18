/*
    purpose: This file contains exapmle of a class usnig wrong variable
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

program test;
    int i = 4;

    class Bug;
        logic [31:0] data[9];

        //Calling this function changes the program variable
        function void display;
            //Forget to declare i in the following for loop
          for( i=0 ; i<$size(data); ++i)
                $display("data[%0d] = %x", i, data[i]);
        endfunction
    endclass

    initial begin
        Bug b;
        b= new;

        b.display();

    end
endprogram

/*
output:
    data[4] = xxxxxxxx
    data[5] = xxxxxxxx
    data[6] = xxxxxxxx
    data[7] = xxxxxxxx
    data[8] = xxxxxxxx

*/