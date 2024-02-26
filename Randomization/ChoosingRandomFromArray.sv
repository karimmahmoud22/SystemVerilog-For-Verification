/*
    purpose: This file contains example of choosing random from array
    Author: Karim Mahmoud Kamal
    Date:    25th of February 2024
*/

module choosing_random_from_array();

    class Days;
        typedef enum {Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday} days_e;
        rand days_e day;
        days_e days[$];
        constraint cday {
            day inside days;
        }
    endclass

    Days d;

    initial begin
        d = new();
        d.days = '{Days::Sunday, Days::Monday, Days::Tuesday, Days::Wednesday, Days::Thursday, Days::Friday, Days::Saturday};
        assert( d.randomize() );
        $display("Random day is %s", d.day.name());

        d.days = '{Days::Sunday, Days::Monday};
        assert( d.randomize() );
        $display("Random day is %s", d.day.name());
    end
endmodule