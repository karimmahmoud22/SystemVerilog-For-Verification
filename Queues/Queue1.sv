/*
    purpose: This file contains some basic operations on a queue
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

/*
    Notes:
    The queue elements are stored in contiguous locations, and so it is efficient to 
    push and pop elements from the front and back. 
    This takes a fixed amount of time no matter how large the queue.

    Adding and deleting elements in the middle of a queue requires shifting the 
    existing data to make room. The time to do this grows linearly with the size of 
    the queue.

    You can also copy the contents of a fixed or dynamic array into a queue.
*/

module queue1();
    int i=7;
    int q1[$] = {3,4};
    int q2[$] = {2,4,6,8,10};

    initial begin
        // insert take 2 arguments, the first is the index and the second is the value
        q2.insert(2,100);
        $display("q2 = %p",q2);

        // delete take 1 argument, the index
        q2.delete(2);
        $display("q2 = %p",q2); 

        // push_front take 1 argument, the value
        q2.push_front(100);
        $display("q2 = %p",q2);

        // pop_front take no arguments
        q2.pop_front();

        // push_back take 1 argument, the value
        q2.push_back(100);

        // pop_back take no arguments
        q2.pop_back();

        // size take no arguments
        $display("q2 size = %0d",q2.size());

        // empty take no arguments
        $display("q2 is empty = %0d",q2.empty());

        // clear take no arguments
        q2.clear();

        // delete the queue
        q2.delete();
        $display("q2 = %p",q2);

    end
endmodule