/*
    purpose: This file contains some basic operations on a queue
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module queue3();

    int q1[$];

    initial begin
        q1.push_front(2);
        q1.push_front(12);
        q1.push_front(22);
        q1.push_back(11);
        q1.push_back(99);
        $display("1: q.size() = %0d", q1.size());
        $display("2: q.pop_front() = %0d", q1.pop_front());
        $display("3: q.pop_back() = %0d", q1.pop_back());
        q1.delete(3);
        $display("4: q.size() = %0d", q1.size());
        
    end

endmodule