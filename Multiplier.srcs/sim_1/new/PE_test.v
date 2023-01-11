`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 16:04:33
// Design Name: 
// Module Name: PE_test
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


module PE_test();
reg clk =0;
wire [79:0] answer;
reg [3:0] a = 4'd5;
reg [3:0] b = 4'd6;
wire [3:0] a_last;
wire [3:0] b_last;
reg rstn = 1;
always #1 clk=~clk;

PE PE(.a(a),.b(b),.a_last(a_last),.b_last(b_last),.res(answer),.clk(clk),.rstn(rstn));
endmodule
