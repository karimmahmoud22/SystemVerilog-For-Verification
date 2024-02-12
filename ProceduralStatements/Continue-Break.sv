/*
    purpose: This file contains continue and break examples
    Author: Karim Mahmoud Kamal
    Date:    11th of February 2024
*/

module continue_break();

    initial begin
        bit [127:0] cmd;
        int file;

        file = $fopen("command.txt", "r");

        while( ! $feof(file) ) begin
            $fscanf(file, "%s", cmd);
            case (cmd)
                "": continue;
                "done": break;
            endcase
            $display("Command: %s", cmd);
        end
        $fclose(file);
    end

endmodule

/*
output:
    Command:              add
    Command:         subtract
    Command:         multiply

    Spacing is due to cmd is 128bit wide => 16 characters
    if cmd = 16bit = 2 characters, then it will take only the least significant 2 characters
*/