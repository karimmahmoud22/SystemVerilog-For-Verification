/*
    purpose: This file contains scoping rules example
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/


int limit;

program p;
    int limit;

    class Foo;
        int limit, arr [];

        task print (int limit);
            for( int i=0 ; i<limit ;++i)
                $display("%m: arra[%0d] = %0d", i, arr[i]);
        endtask
    endclass

initial begin
    limit = $root.limit;
    Foo bar;
    bar = new;
    b.array = new [limit];
    b.print(limit);
end
