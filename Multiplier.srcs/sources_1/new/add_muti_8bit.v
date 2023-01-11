`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/28 15:33:54
// Design Name: 
// Module Name: add_muti_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_muti_8bit(
a,b,result
    );
input [7:0] a,b;
output [15:0] result;

//两个数的高位和低位
reg [3:0] a_h, a_l;
reg [3:0] b_h, b_l;
//中间数
reg [7:0] z_0,z_1,z_2;
reg [3:0] y_a,y_b;

wire [7:0] z0_res,z1_res,z2_res,y_res;
wire [11:0] z_1_r;
wire [15:0] z_2_r;
always@(*)begin
a_h <= a[7:4];
a_l <= a[3:0];
b_h <= b[7:4];
b_l <= b[3:0];
y_a <= (a_h > a_l)? a_h-a_l:a_l-a_h;
y_b <= (b_h > b_l)? b_h-b_l:b_l-b_h;
end

always@(*)begin
z_0 <= z0_res;
z_2 <= z2_res;
z_1 <= z0_res +z2_res-y_res;
end

assign z_2_r = z_2 << 8;
assign z_1_r = z_1 << 4;
assign result = z_2_r + z_1_r + z_0;

add_muti a_4bit_0(.a(a_l),.b(b_l),.result(z0_res));
add_muti a_4bit_1(.a(a_h),.b(b_h),.result(z2_res));
add_muti a_4bit_2(.a(y_a),.b(y_b),.result(y_res));
endmodule
