/*
    purpose: This file contains example of function and task
    Author: Karim Mahmoud Kamal
    Date:    22th of February 2024
*/

module function_task();

    function void test1 ();
        $display("function");
        test2();
    endfunction

    task test2();
        $display("task");
        test1();
    endtask    

    initial
    begin
        test1();
        test2();
    end


endmodule


/*
    infinite loop ==> task call function and function call task
*/

/*
Notes:
    - function can call task
    - task can call function
    - task can call task
    - function can call function
*/