//BOOTH MULTIPLIER:
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mul32
module mul32(x,y,z);
input signed[31:0] x;
input signed[31:0] y;
output signed [63:0] z;
reg signed[63:0] z;
reg [1:0] temp;
reg e;
reg [31:0] y1;
integer i;
always@(x,y)
begin
e=1'd0;
z=64'd0;
for(i=0;i<32;i=i+1)
begin
temp={x[i],e};
y1=-y;

case(temp)
2'd2:z[63:32]=z[63:32]+y1;
2'd1:z[63:32]=z[63:32]+y;
default:begin
end
endcase
z=z >>1;
z[63]=z[62];
e=x[i];
end
if(y==32'd2147483648)
z=-z;
end
endmodule
CLA 32 BIT:
`timescale 1ns / 1ps