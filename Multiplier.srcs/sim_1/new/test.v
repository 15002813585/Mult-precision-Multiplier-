`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 15:42:13
// Design Name: 
// Module Name: test
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


module test();
    reg [35:0] A_in;
	reg [35:0] B_in;
	reg clk = 1'b0;
	reg rstn;
	wire [9:0] A11,A12,A13,A21,A22,A23,A31,A32,A33;
	wire [89:0] Answer;
	always #5 clk = ~clk;
	
	initial 
	begin
	    rstn =1'b1;
		A_in={4'd1,4'd2,4'd3,4'd4,4'd5,4'd6,4'd7,4'd8,4'd9};
		B_in={4'd2,4'd3,4'd5,4'd8,4'd6,4'd10,4'd11,4'd12,4'd13};
		
	#90 A_in={4'd9,4'd8,4'd7,4'd6,4'd5,4'd4,4'd3,4'd2,4'd1};
	    B_in={4'd5,4'd3,4'd5,4'd7,4'd9,4'd10,4'd15,4'd2,4'd11};
	    
	#90 A_in={4'd5,4'd2,4'd2,4'd7,4'd14,4'd1,4'd8,4'd2,4'd3};
	    B_in={4'd4,4'd8,4'd10,4'd11,4'd2,4'd9,4'd13,4'd8,4'd14};
	end
	
	Top  top(.A_in(A_in),.B_in(B_in),.clk(clk),.rstn(rstn),.res_out(Answer),
	         .A11(A11),.A12(A12),.A13(A13),
	         .A21(A21),.A22(A22),.A23(A23),
	         .A31(A31),.A32(A32),.A33(A33));

endmodule
