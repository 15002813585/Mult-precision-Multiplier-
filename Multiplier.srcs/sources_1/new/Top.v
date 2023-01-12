`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/16 13:10:39
// Design Name: 
// Module Name: Top
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


module Top(
A_in,B_in,clk,rstn,res_out,
//rstn_show,//simulation
//A11,A12,A13,A21,A22,A23,A31,A32,A33  //simulation
    );
    input [35:0] A_in;
    input [35:0] B_in;
    input clk,rstn;
    output [89:0] res_out;
    //output [10:0] A11,A12,A13,A21,A22,A23,A31,A32,A33; //simulation
    //output rstn_show;//simulation
    //reg rst_n;
    //reg [89:0] result;
    //reg [9:0] res [0:2][0:2];
    //reg [3:0] B1 [0:2][0:2];
    //reg [3:0] A1 [0:2][0:2];
    //reg [3:0] cnt = 4'b0;
    //reg [3:0] data_11,data_12,data_13;
    //reg [3:0] data_21,data_22,data_23;
    wire [3:0] data_11,data_12,data_13;
    wire [3:0] data_21,data_22,data_23;
    wire [3:0] a_last_11,b_last_11,a_last_12,b_last_12,a_last_13,b_last_13;
    wire [3:0] a_last_21,b_last_21,a_last_22,b_last_22,a_last_23,b_last_23;
    wire [3:0] a_last_31,b_last_31,a_last_32,b_last_32,a_last_33,b_last_33;
    wire [9:0] res11,res12,res13;
    wire [9:0] res21,res22,res23;
    wire [9:0] res31,res32,res33;
    wire rstn_final;
    wire rst_n;
    wire [89:0]result;
   //always@(A_in or B_in)
    //begin
     //{A1[0][0],A1[0][1],A1[0][2],A1[1][0],A1[1][1],A1[1][2],A1[2][0],A1[2][1],A1[2][2]} <= A_in;
     //{B1[0][0],B1[0][1],B1[0][2],B1[1][0],B1[1][1],B1[1][2],B1[2][0],B1[2][1],B1[2][2]} <= B_in;
     ////{res[0][0],res[0][1],res[0][2],res[1][0],res[1][1],res[1][2],res[2][0],res[2][1],res[2][2]} <= 90'b0;
     //rst_n <= 1'b1;
     //end
     
    /*always@(posedge clk or negedge rst_n)
    begin
            if (cnt == 4'd8)begin 
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
end*/

assign rstn_final = rstn && rst_n;
/*assign A11 = res11;
assign A12 = res12;
assign A13 = res13;
assign A21 = res21;
assign A22 = res22;
assign A23 = res23;
assign A31 = res31;
assign A32 = res32;
assign A33 = res33;
assign rstn_show = rstn_final;*/

assign res_out = result;

Control Control_1(
.clk(clk),.rstn_out(rst_n),
.data_11_out(data_11),.data_12_out(data_12),.data_13_out(data_13),
.data_21_out(data_21),.data_22_out(data_22),.data_23_out(data_23),
.res11(res11),.res12(res12),.res13(res13),
.res21(res21),.res22(res22),.res23(res23),
.res31(res31),.res32(res32),.res33(res33),
.result_out(result),
.A_in(A_in),.B_in(B_in)
    );

PE PE_11(.a(data_11),.b(data_21),.a_last(a_last_11),.b_last(b_last_11),.res(res11),.clk(clk),.rstn(rstn_final));

PE PE_12(.a(a_last_11),.b(data_22),.a_last(a_last_12),.b_last(b_last_12),.res(res12),.clk(clk),.rstn(rstn_final));

PE PE_13(.a(a_last_12),.b(data_23),.a_last(a_last_13),.b_last(b_last_13),.res(res13),.clk(clk),.rstn(rstn_final));

PE PE_21(.a(data_12),.b(b_last_11),.a_last(a_last_21),.b_last(b_last_21),.res(res21),.clk(clk),.rstn(rstn_final));

PE PE_22(.a(a_last_21),.b(b_last_12),.a_last(a_last_22),.b_last(b_last_22),.res(res22),.clk(clk),.rstn(rstn_final));

PE PE_23(.a(a_last_22),.b(b_last_13),.a_last(a_last_23),.b_last(b_last_23),.res(res23),.clk(clk),.rstn(rstn_final));

PE PE_31(.a(data_13),.b(b_last_21),.a_last(a_last_31),.b_last(b_last_31),.res(res31),.clk(clk),.rstn(rstn_final));

PE PE_32(.a(a_last_31),.b(b_last_22),.a_last(a_last_32),.b_last(b_last_32),.res(res32),.clk(clk),.rstn(rstn_final));

PE PE_33(.a(a_last_32),.b(b_last_23),.a_last(a_last_33),.b_last(b_last_33),.res(res33),.clk(clk),.rstn(rstn_final));

endmodule
