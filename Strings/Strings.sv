/*
    purpose: This file contains some string operations
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module strings();

    string s;

    initial begin
        s = "IEEE ";

        $display("1: s = %0s", s);
        
        // get the first character
        $display("2: s.getc(0) = %0s", s.getc(0));
        $display("3: s.tolower() = %0s", s.tolower());
        $display("4: s.toupper() = %0s", s.toupper());
        $display("5: s.len() = %0d", s.len());

        // replaca a char in a string
        s.putc(s.len-1, "X");
        $display("6: s = %0s", s);

        // concatenation
        s = { s , "karim" };
        $display("7: s = %0s", s);

        // substring
        // s.substr(start, end) returns a substring starting from start to end
        $display("8: s.substr(0, 4) = %0s", s.substr(0, 4));

        #10;
        my_log("End of the simulation");
        #20
        my_log("End of the simulation");
    end

    // Task
    task my_log ( string msg);
        $display("@%0t: ", $time, " ==> %0s", msg);
    endtask


endmodule

/*
Notes:

    Note that, unlike C, there is no null character at the end of a string, and any 
    attempt to use the character "\0" is ignored

    Memory for strings is dynamically allocated, so you do not have to worry about 
    running out of space to store the string.

    
*/