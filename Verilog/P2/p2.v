module comp(a,b,out1,out2,out3); 	
input a,b;
output reg out1, out2, out3;

always @(*)
begin

out1 = 0;
out2 = 0;
out3 = 0;

if(a==b)
out1 = 1;

else if(a>b)
out2 = 1;

else
out3 = 1;

end
endmodule



module test;
wire out1, out2, out3;
reg a,b;
comp mygate(a,b,out1,out2,out3);
initial
begin
$monitor("  %b   %b           %b     %b     %b", a,b,out1,out2,out3);
a=0;
b=0;
#1
a=0;
b=1;
#1
a=1;
b=0;
#1
a=1;
b=1;
end
endmodule