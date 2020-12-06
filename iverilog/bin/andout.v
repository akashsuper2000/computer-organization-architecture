module hey;
wire c;
reg a,b,s;
hello mygate(.a(a), .b(b), .s(s), .c(c));
initial
begin

$monitor("%b & %b = %b", a,b,s,c);
a = 1'b0;
b = 1'b1;
s = 1'b0;
#1
a = 1'b1;
b = 1'b1;
s = 1'b1;

end
endmodule