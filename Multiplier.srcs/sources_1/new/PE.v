`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/15 21:27:21
// Design Name: 
// Module Name: PE
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


module PE(
a,b,a_last,b_last,res,clk,rstn
    );
input clk,rstn;
input wire[3:0] a;
input wire[3:0] b;
output wire[9:0] res; 
output wire[3:0] a_last;
output wire[3:0] b_last;
wire[7:0] res_temp;
reg[3:0] data_outA = 4'b0;
reg[3:0] data_outB = 4'b0;
reg[9:0] res_reg = 10'b0;
reg[3:0] Alast = 4'b0;
reg[3:0] Blast = 4'b0;
always@(posedge clk or negedge rstn) 
    begin
        if(!rstn)
            begin
                Alast <= 4'd0;
                Blast <= 4'd0;
                data_outA <= 4'd0;
                data_outB <= 4'd0;
                res_reg <= 10'b0;
            end
        else
            begin
                data_outA <= a;
                data_outB <= b;
                Alast <= data_outA;
                Blast <= data_outB;
            end
    end
always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            res_reg<= 4'd0;
        else
            begin
            res_reg<= res_reg + res_temp;
            end
    end
assign a_last = data_outA;
assign b_last = data_outB;
assign res = res_reg;
Multiplier m1(.a(a),.b(b),.out(res_temp),.rstn(rstn));
endmodule


