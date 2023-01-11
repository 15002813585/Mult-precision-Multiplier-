`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/18 09:06:57
// Design Name: 
// Module Name: register_test
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


module register_test(
    );
reg clk =0;
reg [3:0] in = 4'd8;
reg rstn =1;
always #5 clk =~clk;
wire [3:0] answer;
register reg_1(.data_in(in),.data_out(answer),.clk(clk),.rstn(rstn));
endmodule
