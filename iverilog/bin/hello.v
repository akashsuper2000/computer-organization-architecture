module mux(out, in1, in2, in3, in4, s1, s2); 	
input in1, in2, in3, in4, s1, s2;
output reg out;
always @(*)
case ({s2, s1})
	2'b00: out = in1;
	2'b01: out = in2;
	2: out = in3;
	3: out = in4;
endcase
endmodule

module hello;
wire out;
reg in1, in2, in3, in4, s1, s2;
mux p(out, in1, in2, in3, in4, s1, s2);
initial
begin
in1 = 0;
in2 = 1;
in3 = 1;
in4 = 11;
$monitor("%b %b    %b", s2, s1, out);
s1 = 0;
s2 = 0;
#1
s1 = 1;
s2 = 0;
#1
s1 = 0;
s2 = 1;
#1
s1 = 1;
s2 = 1;
end

endmodule