/*
    purpose: This file contains exapmle of this keyword
    Author: Karim Mahmoud Kamal
    Date:    17th of February 2024
*/

module test();

    class Scoping;
        string name;

        function new ( string name);
            this.name = name;
        endfunction

        function display ( );
            $display(this.name);
        endfunction

    endclass

    initial begin
        Scoping s;
        s= new("Karim Mahmoud");
        s.display();
    end

endmodule