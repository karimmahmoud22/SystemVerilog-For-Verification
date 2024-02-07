/*
    purpose: This file contains the array definitions for the project
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module arrays();

    int arr1 [4] = '{1,2,3,4};  // 4 ints [0]...[3]
    int arr2 [5];

    initial begin

        $display("1: arr1 = ", arr1);
        $display("2: arr2 = ", arr2);

        arr2 = '{4,3,2,1,0};    // 5 ints [0]...[4]
        $display("3: arr2 = ", arr2);

        arr2[0:2] = '{5,6,7};  // 3 ints [0]...[2]
        $display("4: arr2 = ", arr2);

        arr1 = '{4{9}};  // 4 ints [0]...[3]
        $display("5: arr1 = ", arr1);

        arr2 = '{default:-1};
        $display("6: arr2 = ", arr2);
    end
endmodule


/*

module arrays();

    int arr1[0:15];  // 16 ints [0]...[15]
    int arr2[16];  // 16 ints [0]...[15]

    int arr3[0:7][0:3];  //Verbose declaration: 8 rows x4 col ints [0][0]...[15][15]
    int arr4[8][4];  // Compact declaration: 8 rows x4 col ints [0][0]...[15][15]

    initial begin
        arr1[3] = 5;
        arr2[7][3] = 1;
    end
endmodule

*/