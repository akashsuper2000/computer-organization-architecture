module led(a,b,c,d,e,f,g,out1,out2,out3,out4); 	
input a,b,c,d,e,f,g;
output reg out1, out2, out3, out4;

always @(*)
begin

if(a==0 && b==1 && c==1 && d==0 && e==0 && f==1 && g==1) begin
out1 = 0;
out2 = 1;
out3 = 0;
out4 = 0;
end

else if(a==1 && b==0 && c==1 && d==1 && e==0 && f==1 && g==1) begin
out1 = 0;
out2 = 1;
out3 = 0;
out4 = 1;
end

else if(a==1 && b==0 && c==1 && d==1 && e==1 && f==1 && g==1) begin
out1 = 0;
out2 = 1;
out3 = 1;
out4 = 0;
end

else if(a==1 && b==1 && c==1 && d==0 && e==0 && f==0 && g==0) begin
out1 = 0;
out2 = 1;
out3 = 1;
out4 = 1;
end

else if(a==1 && b==1 && c==1 && d==1 && e==1 && f==1 && g==1) begin
out1 = 1;
out2 = 0;
out3 = 0;
out4 = 0;
end

else if(a==1 && b==1 && c==1 && d==1 && e==0 && f==1 && g==1) begin
out1 = 1;
out2 = 0;
out3 = 0;
out4 = 1;
end

else begin
out1 = 0;
out2 = 0;
out3 = 0;
out4 = 0;
end


end
endmodule



module test;
wire out1, out2, out3, out4;
reg a,b,c,d,e,f,g;
led mygate(a,b,c,d,e,f,g,out1,out2,out3,out4);
initial
begin
$monitor("  %b   %b   %b   %b   %b   %b   %b           %b     %b     %b     %b", a,b,c,d,e,f,g,out1,out2,out3,out4);
a=0;
b=1;
c=1;
d=0;
e=0;
f=1;
g=1;
#1
a=1;
b=0;
c=1;
d=1;
e=0;
f=1;
g=1;
#1
a=1;
b=0;
c=1;
d=1;
e=1;
f=1;
g=1;
#1
a=1;
b=1;
c=1;
d=0;
e=0;
f=0;
g=0;
#1
a=1;
b=1;
c=1;
d=1;
e=1;
f=1;
g=1;
#1
a=1;
b=1;
c=1;
d=1;
e=0;
f=1;
g=1;

end
endmodule