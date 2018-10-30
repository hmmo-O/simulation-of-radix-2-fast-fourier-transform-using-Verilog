//BUTTERFLY UNIT
`timescale 1ns / 1ps
// Design Name: DSP Butterfly
// Module Name: butterfly
// Target Devices: Spartan6
module butterfly(a1,b1,a2,b2,wr,wi,z1r,z1r_c,clk,z1i,z1i_c,z2r,z2r_c,z2i,z2i_c );
input [31:0]a1,b1,a2,b2;
input[31:0]wr,wi;
input clk;
output [31:0]z1r,z1i,z2r,z2i,z1r_c,z1i_c,z2r_c,z2i_c;
wire [31:0] x1,x2,x3,x4,z_t_i,z_t_i_c,z_t_r,z_t_r_c;
// this one is to multiply twiddle factor with the second number
//this is a complex number multiplication so it needs 4 normal multiplications
//to separate the real & complex parts
mul32 s1(a2,wr,x1);//
mul32 s2(b2,wi,x2);//
mul32 s3(a2,wi,x3);//
mul32 s4(b2,wr,x4);//
// This stage is to add/sub the product of multiplication to the first number
cla32 s5(x3,x4,clk,0,z_t_i,z_t_i_c);
cla32 s6(x1,x2,clk,1,z_t_r,z_t_r_c);
cla32 s7(z_t_r,a1,clk,0,z1r,z1r_c);
cla32 s8(z_t_i,b1,clk,0,z1i,z1i_c);
cla32 s9(z_t_r,a1,clk,1,z2r,z2r_c);
cla32 s10(z_t_i,b1,clk,1,z2i,z2i_c);
endmodule