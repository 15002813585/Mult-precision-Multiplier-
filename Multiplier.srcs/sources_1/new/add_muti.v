`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/26 17:22:20
// Design Name: 
// Module Name: add_muti
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


module add_muti(
a,b,result
    );
input [3:0] a;
input [3:0] b;
output [7:0] result;
//扩展至8位
reg [7:0] a_r;
reg [7:0] b_r;
//移位结果
wire [15:0] a_r_0;
wire [15:0] a_r_1;
wire [15:0] a_r_2;
wire [15:0] a_r_3;
wire [15:0] a_r_4;
wire [15:0] a_r_5;
wire [15:0] a_r_6;
wire [15:0] a_r_7;
//输出结果
wire [15:0] res_0;
wire [15:0] res_1;
wire [15:0] res_2;
wire [15:0] res_3;
wire [15:0] res_4;
wire [15:0] res_5;
wire [15:0] res_6;
wire [15:0] res_7;

wire [15:0] res;

always@(*)begin
a_r <= {1'b0,1'b0,1'b0,1'b0,a};
b_r <= {1'b0,1'b0,1'b0,1'b0,b};
end

assign a_r_0 = a_r;
assign a_r_1 = a_r_0 << 1;
assign a_r_2 = a_r_1 << 1;
assign a_r_3 = a_r_2 << 1;
assign a_r_4 = a_r_3 << 1;
assign a_r_5 = a_r_4 << 1;
assign a_r_6 = a_r_5 << 1;
assign a_r_7 = a_r_6 << 1;

assign res_0 =b_r[0]?a_r_0:16'b0;
assign res_1 =b_r[1]?a_r_1:16'b0;
assign res_2 =b_r[2]?a_r_2:16'b0;
assign res_3 =b_r[3]?a_r_3:16'b0;
assign res_4 =b_r[4]?a_r_4:16'b0;
assign res_5 =b_r[5]?a_r_5:16'b0;
assign res_6 =b_r[6]?a_r_6:16'b0;
assign res_7 =b_r[7]?a_r_7:16'b0;

assign res = res_0 + res_1 + res_2 + res_3 + res_4 + res_5 + res_6 + res_7;

assign result = res[7:0];
endmodule
