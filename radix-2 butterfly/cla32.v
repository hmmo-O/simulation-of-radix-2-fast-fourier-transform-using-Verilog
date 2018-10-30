//CARRY-LOOK AHEAD ADDER 32-bit
// Module Name: cla32
module cla32( d1,d2,clk,cin,sum,cout);
input [31:0] d1;
input [31:0] d2;
input clk;
input cin;
output cout;
output [31:0] sum;
wire c0,c1,c2,c3,c4,c5,c6;
reg [31:0] b;
always@(posedge clk)
begin
if(cin==1)
b<=-d2-1;
else
b<=d2;
end
cla4 n1(d1[3:0],b[3:0],cin,sum[3:0],c0);
cla4 n2(d1[7:4],b[7:4],c0,sum[7:4],c1);
cla4 n3(d1[11:8],b[11:8],c1,sum[11:8],c2);
cla4 n4(d1[15:12],b[15:12],c2,sum[15:12],c3);
cla4 n5(d1[19:16],b[19:16],c3,sum[19:16],c4);
cla4 n6(d1[23:20],b[23:20],c4,sum[23:20],c5);
cla4 n7(d1[27:24],b[27:24],c5,sum[27:24],c6);
cla4 n8(d1[31:28],b[31:28],c6,sum[31:28],cout);
endmodule