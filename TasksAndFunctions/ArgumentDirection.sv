/*
    purpose: This file contains some examples of the argument direction
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module Task1();

    // shift left by 2 is equivalent to multiplying by 4

    // The following 2 ways are equivalent

    // Task
    task my_task1 (input logic [31:0] a, output logic [31:0] b);
        b = a << 2 ;
    endtask

    task my_task2 ();
        input logic [31:0] a;
        output logic [31:0] b;
        b = a << 2 ;
    endtask


    initial begin
        int a = 5;
        int b;
        my_task1(a, b);
        $display("1: The input is %d", a);
        $display("2: The result is %d", b);

        my_task2(a, b);
        $display("3: The input is %d", a);
        $display("4: The result is %d", b);
    end

endmodule

/*
Note:
    The default direction of the argument of the task is input
    The default data type of the argument of the task is logic    

    example:
    task T3(a, b, output bit [15:0] u, v); 
    The arguments a and b are input logic, 1-bit wide.
    The arguments u and v are 16-bit output bit types.

*/