`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/28 19:18:38
// Design Name: 
// Module Name: DIVU
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


module DIVU1(
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output [31:0] q,
    output [31:0] r,
    output reg busy,
     output reg over
    );
  //  assign q=dividend/divisor;
   // assign r=dividend%divisor;
    reg[4:0]count;
    reg [31:0] reg_q;//初始化为被除数，结果为商；
    reg [31:0] reg_r;//初始化为零，结果为余数
    reg [31:0] reg_b;//初始化为除数
    reg r_sign;//r_sign余数符号
    
    wire [32:0]sub_add=r_sign?({reg_r,q[31]}+{1'b0,reg_b}):({reg_r,q[31]}-{1'b0,reg_b});
    assign r = r_sign? reg_r + reg_b : reg_r;//最后一步如果商为0加上除数
    assign q = reg_q;
    always @ (posedge clock or posedge reset)begin
    if(reset)begin
     count<=5'b0;
     busy<=0;
     over<=0;
   end
   else begin
     if(start)begin
     reg_r <= 32'b0;
     r_sign <= 0;
     reg_q <= dividend;
     reg_b <= divisor;
     count <= 5'b0;
     busy <= 1'b1;
     end
     else if(busy)begin
     reg_r<=sub_add[31:0];//余数
     r_sign<=sub_add[32];//符号
     reg_q<={reg_q[30:0],~sub_add[32]};  //如果为负，下次相加
     count<=count+4'b1;   //计数器加一
     if(count == 5'b11111)begin
     busy<=0;
     over<=1;
     end
     end
     end
     end
     endmodule
     
     
    
