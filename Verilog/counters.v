/* This always block will be triggered 
   at the rising edge of clk (0->1)
   Once inside this block, 
   it checks if the reset is 0, 
   if yes then change out to zero
   If reset is 1, 
   then design should be allowed to count up, 
   so increment counter
*/

module counter(clk, reset, counter_up);
input clk, reset;
output reg [3:0]counter_up;
always @(posedge clk) 
begin
if(reset==0)
 counter_up = 4'b0001;
else begin
counter_up[3] <= counter_up[0];
counter_up[2] <= counter_up[3];
counter_up[1] <= counter_up[2];
counter_up[0] <= counter_up[1];
end
end
endmodule

module test;
wire [3:0]counter_up;
reg clk, reset;
counter a(clk, reset, counter_up);
initial 
begin 
$monitor("%2d %b %b",$time,clk,counter_up);
clk = 1'b1;
reset = 1'b0;
#1 reset = 1'b1;
#200 $finish;
end
always #5 clk=~clk;
endmodule
