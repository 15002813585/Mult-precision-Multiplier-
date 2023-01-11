`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/29 22:09:38
// Design Name: 
// Module Name: add_muti_8bit_test
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


module add_muti_8bit_test(
    );
reg [7:0] a_in,b_in;
wire [15:0] result;

initial begin
 a_in = 8'd210;
 b_in = 8'd45;
end

add_muti_8bit a1(.a(a_in),.b(b_in),.result(result));
endmodule
