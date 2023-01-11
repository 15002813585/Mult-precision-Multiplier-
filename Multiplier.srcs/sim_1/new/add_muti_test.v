`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/27 13:19:56
// Design Name: 
// Module Name: add_muti_test
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


module add_muti_test();
reg [3:0] a_in;
reg [3:0] b_in;
wire [7:0] result;
 
initial begin
a_in = 4'd9;
b_in = 4'd8;
end

add_muti a1(.a(a_in),.b(b_in),.result(result));
endmodule
