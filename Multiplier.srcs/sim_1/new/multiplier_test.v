`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 16:15:40
// Design Name: 
// Module Name: multiplier_test
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


module multiplier_test( );
reg [3:0] a=4'd5;
reg [3:0] b=4'd6;
reg clk = 0;
wire [7:0] answer;
always #5 clk=~clk;

Multiplier mut(.a(a),.b(b),.out(answer),.clk(clk));
endmodule
