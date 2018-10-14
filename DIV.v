`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/30 09:10:57
// Design Name: 
// Module Name: DIV
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


module DIV1(
    input signed[31:0] dividend,
    input signed[31:0] divisor,
    input start,
    input clock,
    input reset,
    output signed [31:0] q,
    output signed [31:0] r,
   output reg busy,
    output reg over
    );
   // assign q=dividend/divisor;
  //  assign r=dividend%divisor; 
      reg[4:0]count;
       reg [31:0] reg_q;//��ʼ��Ϊ�����������Ϊ�̣�
       reg [31:0] reg_r;//��ʼ��Ϊ�㣬���Ϊ����
       reg [31:0] reg_b;//��ʼ��Ϊ����
       reg r_sign;//r_sign��������
       
 
        reg dend_sign;
        reg sor_sign;
         wire [32:0]sub_add=r_sign?({reg_r,reg_q[31]}+{1'b0,reg_b}):({reg_r,reg_q[31]}-{1'b0,reg_b});
          assign r = dend_sign?~(r_sign? reg_r + reg_b : reg_r)+1'b1:r_sign? reg_r + reg_b : reg_r;//���һ�������Ϊ0���ϳ���
           assign q = dend_sign^sor_sign?~reg_q+1'b1:reg_q;
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
            reg_q <= dividend[31]?~dividend+1'b1:dividend;
            reg_b <= divisor[31]?~divisor+1'b1:divisor;
            dend_sign<=dividend[31];
            sor_sign<=divisor[31];
            count <= 5'b0;
            busy <= 1'b1;
            end
            else if(busy)begin
            reg_r<=sub_add[31:0];//����
            r_sign<=sub_add[32];//����
            reg_q<={reg_q[30:0],~sub_add[32]};  //���Ϊ�����´����
            count<=count+4'b1;   //��������һ
            if(count == 5'b11111)begin
            busy<=0;
            over<=1;
            end
           
            end
            end
            end
        
        endmodule
        
        
       
