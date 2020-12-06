module shift_register_v(
input CLK,
input RST,
input DATA_IN,
output BIT_OUT,
output [7:0] BYTE_OUT
);

//————————————————————–
// signal definitions
//————————————————————–

//shift register signals
reg [7:0] bitShiftReg;
reg [7:0] byteShiftReg[11:0];
integer i;

//————————————————————–
// shift register
//————————————————————–

//shift register
always @(posedge CLK)
begin

//bit shift register
bitShiftReg <= {bitShiftReg[6:0],DATA_IN};

//byte shift register
byteShiftReg[0] <= bitShiftReg;
for(i=1;i<12;i=i+1)
byteShiftReg[i] <= byteShiftReg[i-1];
end

//————————————————————–
// outputs
//————————————————————–

//module output wires
assign BIT_OUT = bitShiftReg[7];
assign BYTE_OUT = byteShiftReg[11];
end
endmodule




//-----------------------------------------------------------------------------
//
// Title       : siso
// Design      : upload_design1
// Author      : Naresh Singh Dobal
// Company     : nsd
//
//-----------------------------------------------------------------------------
//
// File        : Design of Serial In - Serial Out Shift Register using d_flip flop.v


module siso ( din ,clk ,reset ,dout );

output dout ;

input din ;
input clk ;
input reset ;   
wire [2:0]s;

d_flip_flop u0 (.din(din),
.clk(clk),
.reset(reset),
.dout(s[0]));


d_flip_flop u1 (.din(s[0]),
.clk(clk),
.reset(reset),
.dout(s[1]));


d_flip_flop u2 (.din(s[1]),
.clk(clk),
.reset(reset),
.dout(s[2]));


d_flip_flop u3 (.din(s[2]),
.clk(clk),
.reset(reset),
.dout(dout));


endmodule




// -------------- D flip flop  design - -----------------------



//-----------------------------------------------------------------------------
//
// Title       : d_flip_flop
// Design      : upload_design1
// Author      : Naresh Singh Dobal
// Company     : nsd
//
//-----------------------------------------------------------------------------
//
// File        : d_flip_flop.v



module d_flip_flop ( din ,clk ,reset ,dout );

output dout ;
reg dout;

input din ;
input clk ;
input reset ; 

always @ (posedge clk)
begin
 if (reset)
  dout <= 1;
 else
  dout <= din;
end

endmodule