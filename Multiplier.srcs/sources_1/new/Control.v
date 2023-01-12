`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/11 14:19:18
// Design Name: 
// Module Name: Control
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


module Control(
clk,rstn_out,
data_11_out,data_12_out,data_13_out,
data_21_out,data_22_out,data_23_out,
res11,res12,res13,
res21,res22,res23,
res31,res32,res33,
result_out,
A_in,B_in
    );
input clk;
input [35:0] A_in;
input [35:0] B_in;
input [9:0] res11,res12,res13;
input [9:0] res21,res22,res23;
input [9:0] res31,res32,res33;
output rstn_out;
output [3:0] data_11_out,data_12_out,data_13_out;
output [3:0] data_21_out,data_22_out,data_23_out;
output [89:0] result_out;

reg [3:0] data_11,data_12,data_13;
reg [3:0] data_21,data_22,data_23;
reg [3:0] B1 [0:2][0:2];
reg [3:0] A1 [0:2][0:2];
reg [9:0] res [0:2][0:2];
reg [89:0] result;
reg [3:0] cnt =4'b0;
reg rst_n = 1'b1;

always@(A_in or B_in)
     begin
     {A1[0][0],A1[0][1],A1[0][2],A1[1][0],A1[1][1],A1[1][2],A1[2][0],A1[2][1],A1[2][2]} <= A_in;
     {B1[0][0],B1[0][1],B1[0][2],B1[1][0],B1[1][1],B1[1][2],B1[2][0],B1[2][1],B1[2][2]} <= B_in;
     //{res[0][0],res[0][1],res[0][2],res[1][0],res[1][1],res[1][2],res[2][0],res[2][1],res[2][2]} <= 90'b0;
     //rst_n <= 1'b1;
     end
always@(posedge clk)
    begin
            if(!rst_n)   
              cnt<= 4'b0;
              else
              cnt<= cnt + 1'b1;
               if (cnt == 4'd8)begin 
                  result <={res[0][0],res[0][1],res[0][2],
                            res[1][0],res[1][1],res[1][2],
                            res[2][0],res[2][1],res[2][2]};
                  rst_n <=1'b0;
                  //cnt <= cnt + 1'b1;
                  end
                  else if (cnt == 4'd9)begin
                  rst_n <=1'b1;
                  cnt <= 4'b0;
                  end
                  else
                      //cnt<= cnt+ 1'b1;
                      rst_n <= rst_n;
    end
always@(*)begin
    case(cnt)
   4'b0001:begin
    data_11 <= A1[0][0];
    data_12 <= 4'b0;
    data_13 <= 4'b0;
    data_21 <= B1[0][0];
    data_22 <= 4'b0;
    data_23 <= 4'b0;
   end
   4'b0010:begin
   data_11 <= A1[0][1];
   data_12 <= A1[1][0];
   data_13 <= 4'b0;
   data_21 <= B1[0][1];
   data_22 <= B1[1][0];
   data_23 <= 4'b0;
    end
   4'b0011:begin
    data_11 <= A1[0][2];
    data_12 <= A1[1][1];
    data_13 <= A1[2][0];
    data_21 <= B1[0][2];
    data_22 <= B1[1][1];
    data_23 <= B1[2][0];
    end
    4'b0100:begin
    data_11 <= 4'b0;
    data_12 <= A1[1][2];
    data_13 <= A1[2][1];
    data_21 <= 4'b0;
    data_22 <= B1[1][2];
    data_23 <= B1[2][1];
    res[0][0] <= res11;
    end
    4'b0101:begin
    data_11 <= 4'b0;
    data_12 <= 4'b0;
    data_13 <= A1[2][2];
    data_21 <= 4'b0;
    data_22 <= 4'b0;
    data_23 <= B1[2][2];
    res[0][1] <= res12;
    res[1][0] <= res21;
        end
    4'b0110:begin
    data_11 <= 4'b0;
    data_12 <= 4'b0;
    data_13 <= 4'b0;
    data_21 <= 4'b0;
    data_22 <= 4'b0;
    data_23 <= 4'b0;
    res[0][2] <= res13;
    res[1][1] <= res22;
    res[2][0] <= res31;
    end
    
    4'b0111:begin
    data_11 <= 4'b0;
    data_12 <= 4'b0;
    data_13 <= 4'b0;
    data_21 <= 4'b0;
    data_22 <= 4'b0;
    data_23 <= 4'b0;
    res[1][2] <= res23;
    res[2][1] <= res32;
    end
     4'b1000:begin
    data_11 <= 4'b0;
    data_12 <= 4'b0;
    data_13 <= 4'b0;
    data_21 <= 4'b0;
    data_22 <= 4'b0;
    data_23 <= 4'b0;
    res[2][2] <= res33;
    end
     
    default:begin
    data_11 <= 4'b0;
    data_12 <= 4'b0;
    data_13 <= 4'b0;
    data_21 <= 4'b0;
    data_22 <= 4'b0;
    data_23 <= 4'b0;
    end
    endcase
end

assign data_11_out = data_11;
assign data_12_out = data_12;
assign data_13_out = data_13;
assign data_21_out = data_21;
assign data_22_out = data_22;
assign data_23_out = data_23;
assign result_out = result;
assign rstn_out =rst_n;
endmodule
