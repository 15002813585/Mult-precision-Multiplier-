`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 11:43:31
// Design Name: 
// Module Name: register
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


module register(
data_in,data_out,clk,rstn
    );
    input [3:0] data_in;
    input clk,rstn;
    output [3:0] data_out;
    reg[3:0] data = 4'b0;
always@(posedge clk or negedge rstn)
begin
if(!rstn)
    data<=4'b0;
else
    data <= data_in;
end
assign data_out = data;
endmodule
