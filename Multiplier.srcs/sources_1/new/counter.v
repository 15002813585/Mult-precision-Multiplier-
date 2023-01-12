`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/11 14:21:13
// Design Name: 
// Module Name: counter
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


module counter(
clk,rst_n
    );
input clk,rst_n;

reg [3:0] cnt = 4'b0;
always@(posedge clk or negedge rst_n)
    begin
            if(!rst_n)   
              cnt<= 4'b0;
            else if (cnt == 4'd8)begin 
            result <={res[0][0],res[0][1],res[0][2],
                      res[1][0],res[1][1],res[1][2],
                      res[2][0],res[2][1],res[2][2]};
            rst_n <=1'b0;
            cnt <= cnt + 1'b1;
            end
            else if (cnt == 4'd9)begin
            rst_n <=1'b1;
            cnt <= 4'b0;
            end
            else
                cnt<= cnt+ 1'b1;
    end
endmodule
