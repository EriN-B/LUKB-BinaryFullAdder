CREATE OR REPLACE PROCEDURE VOLLADDIERER (x in number, y in number, c_in in number, c_out out number, s_out out number)
IS
     a  number;
     b  number;
     c  number;
     d  number;
     e  number;
BEGIN
    a := bitand(x,y);
    b := (x+y-bitand(x,y)) - (bitand(x,y));
    c := bitand(c_in,b);
    s_out := (c_in-bitand(c_in,b)+b) - (bitand(c_in,b));
    c_out := (a-bitand(a,c)+c);
    DBMS_OUTPUT.PUT_LINE('| '||a||' | '||b||' | '||c||' | '||s_out||' | '||c_out||' | ');
END VOLLADDIERER;
/

DECLARE
     TYPE binar is VARRAY(8) OF number;
     l_binar1 binar := binar(0,0,0,0,1,0,0,1);
     l_binar2 binar := binar(0,0,0,0,1,0,0,1);
     l_binar3 binar := binar(0,0,0,0,0,0,0,0);
     c  number := 0;
     s  number;
     c_in number := 0;
     s_out  number;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('| a | b | c | s | o |');
    DBMS_OUTPUT.PUT_LINE('_____________________');
    for i in reverse 1..8 loop 
        VOLLADDIERER(l_binar1(i),l_binar2(i),c_in,c,s);
        c_in := c;
        l_binar3(i) := s;
   end loop;
   for j in 1..8 loop
    DBMS_OUTPUT.PUT_LINE(l_binar3(j));
   end loop;
END;
/
