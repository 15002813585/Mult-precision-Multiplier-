`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/26 15:31:08
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
a,b,out,rstn
    );
    input rstn;
    input wire[3:0] a;
    input wire[3:0] b;
    output wire[7:0] out;
    wire [7:0] result;
    reg[7:0] out_reg = 8'b0;
    always@(*)
    begin
        if(!rstn)
        out_reg = 0;
        else
        out_reg = result;
    end
    assign out = out_reg;
//add_muti am1(.a(a),.b(b),.result(result));
add_muti a1(.a(a),.b(b),.result(result));
endmodule
