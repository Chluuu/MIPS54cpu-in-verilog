`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/23 18:44:46
// Design Name: 
// Module Name: MULT
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

 /*module MUL(
input sign_s,
input [31:0] a,
input [31:0] b,
output [31:0] mul_result,
output [31:0] mul_h,
output [31:0] mul_l
    );
wire signed [32:0] sa;
 wire signed [32:0] sb;
 reg signed [63:0] r;
 assign sa={a[31],a};
 assign sb={b[31],b};
 assign mul_result=r[31:0];
 assign mul_h=r[63:32];
 assign mul_l=r[31:0];
 always @*
   begin
     case(sign_s)
     0:r=a*b;
     1:r=sa*sb;
     endcase
   end

endmodule*/
 module MUL(
//    input clk,
 //   input reset,
    input signed[31:0] a,
    input signed[31:0] b,
    output signed[63:0] z
    );
    assign z=a*b;
    endmodule
  /* reg [31:0] a_reg;
    reg [31:0] b_reg;
    reg sign0;
    reg sign1;
    reg sign2;
    reg sign3;
    reg sign4;
    reg sign5;
    reg sign;

       // 申请寄存器     
    reg [63:0] temp; 
    reg [63:0]stored[31:0];
    reg [63:0]add2[15:0];
    reg [63:0]add4[7:0];
    reg [63:0]add8[3:0];
    reg [63:0]add16[1:0]; 
   
     integer i;
     
     always@(posedge clk or negedge reset)
     begin
       // reset 置1     
       if(reset) begin 
           temp<=0;
           a_reg<=0;
           b_reg<=0;
           sign0<=0;
           sign1<=0;
           sign2<=0;
           sign3<=0;
           sign4<=0;
           sign5<=0;
           sign<=0;
           i=0;
           while(i<32)
           begin
           stored[i]<=0;
            i=i+1;
           end
           add2[0]<=0;
                 add2[1]<=0;
                 add2[2]<=0;
                 add2[3]<=0;
                 add2[4]<=0;
                 add2[5]<=0;
                 add2[6]<=0;
                 add2[7]<=0;
                 add2[8]<=0;
                 add2[9]<=0;
                 add2[10]<=0;
                 add2[11]<=0;
                 add2[12]<=0;
                 add2[13]<=0;
                 add2[14]<=0;
                 add2[15]<=0;
                 
                 add4[0]<=0;
                 add4[1]<=0;
                 add4[2]<=0;
                 add4[3]<=0;
                 add4[4]<=0;
                 add4[5]<=0;
                 add4[6]<=0;
                 add4[7]<=0;
                 
                 add8[0]<=0;
                 add8[1]<=0;
                 add8[2]<=0;
                 add8[3]<=0;
                 
                 add16[0]<=0;
                 add16[1]<=0;
      end
      else begin
      a_reg<=a[31]?(~a+1'b1):a;
      b_reg<=b[31]?(~b+1'b1):b;
      sign0<=a[31]^b[31];
      
      
          //通过字符拼接方式表示出中间相乘值，并相加            
       stored[0] <= b_reg[0]? {32'b0, a_reg} :64'b0;
       stored[1] <= b_reg[1]? {31'b0, a_reg, 1'b0} :64'b0;
       stored[2] <= b_reg[2]? {30'b0, a_reg, 2'b0} :64'b0;
       stored[3] <= b_reg[3]? {29'b0, a_reg, 3'b0} :64'b0;
       stored[4] <= b_reg[4]? {28'b0, a_reg, 4'b0} :64'b0;
       stored[5] <= b_reg[5]? {27'b0, a_reg, 5'b0} :64'b0;
       stored[6] <= b_reg[6]? {26'b0, a_reg, 6'b0} :64'b0;
       stored[7] <= b_reg[7]? {25'b0, a_reg, 7'b0} :64'b0;
       stored[8] <= b_reg[8]? {24'b0, a_reg, 8'b0} :64'b0;
       stored[9] <= b_reg[9]? {23'b0, a_reg, 9'b0} :64'b0;
       stored[10] <= b_reg[10]? {22'b0, a_reg, 10'b0} :64'b0;
       stored[11] <= b_reg[11]? {21'b0, a_reg, 11'b0} :64'b0;
       stored[12] <= b_reg[12]? {20'b0, a_reg, 12'b0} :64'b0;
       stored[13] <= b_reg[13]? {19'b0, a_reg, 13'b0} :64'b0;
       stored[14] <= b_reg[14]? {18'b0, a_reg, 14'b0} :64'b0;
       stored[15] <= b_reg[15]? {17'b0, a_reg, 15'b0} :64'b0;
       stored[16] <= b_reg[16]? {16'b0, a_reg, 16'b0} :64'b0;
       stored[17] <= b_reg[17]? {15'b0, a_reg, 17'b0} :64'b0;
       stored[18] <= b_reg[18]? {14'b0, a_reg, 18'b0} :64'b0;
       stored[19] <= b_reg[19]? {13'b0, a_reg, 19'b0} :64'b0;
       stored[20] <= b_reg[20]? {12'b0, a_reg, 20'b0} :64'b0;
       stored[21] <= b_reg[21]? {11'b0, a_reg, 21'b0} :64'b0;
       stored[22] <= b_reg[22]? {10'b0, a_reg, 22'b0} :64'b0;
       stored[23] <= b_reg[23]? {9'b0, a_reg, 23'b0} :64'b0;
       stored[24] <= b_reg[24]? {8'b0, a_reg, 24'b0} :64'b0;
       stored[25] <= b_reg[25]? {7'b0, a_reg, 25'b0} :64'b0;
       stored[26] <= b_reg[26]? {6'b0, a_reg, 26'b0} :64'b0;
       stored[27] <= b_reg[27]? {5'b0, a_reg, 27'b0} :64'b0;
       stored[28] <= b_reg[28]? {4'b0, a_reg, 28'b0} :64'b0;
       stored[29] <= b_reg[29]? {3'b0, a_reg, 29'b0} :64'b0;
       stored[30] <= b_reg[30]? {2'b0, a_reg, 30'b0} :64'b0;
       stored[31] <= b_reg[31]? {1'b0, a_reg, 31'b0} :64'b0;
       sign1<=sign0;
       
       add2[0]<=stored[0]+stored[1];
       add2[1]<=stored[2]+stored[3];
       add2[2]<=stored[4]+stored[5];
       add2[3]<=stored[6]+stored[7];
       add2[4]<=stored[8]+stored[9];
       add2[5]<=stored[10]+stored[11];
       add2[6]<=stored[12]+stored[13];
       add2[7]<=stored[14]+stored[15];
       add2[8]<=stored[16]+stored[17];
       add2[9]<=stored[18]+stored[19];
       add2[10]<=stored[20]+stored[21];
       add2[11]<=stored[22]+stored[23];
       add2[12]<=stored[24]+stored[25];
       add2[13]<=stored[26]+stored[27];
       add2[14]<=stored[28]+stored[29];
       add2[15]<=stored[30]+stored[31];
       sign2<=sign1;
       
       add4[0]<=add2[0]+add2[1];
       add4[1]<=add2[2]+add2[3];
       add4[2]<=add2[4]+add2[5];
       add4[3]<=add2[6]+add2[7];
       add4[4]<=add2[8]+add2[9];
       add4[5]<=add2[10]+add2[11];
       add4[6]<=add2[12]+add2[13];
       add4[7]<=add2[14]+add2[15];
     sign3<=sign2;
       
       add8[0]<=add4[0]+add4[1];
       add8[1]<=add4[2]+add4[3];
       add8[2]<=add4[4]+add4[5];
       add8[3]<=add4[6]+add4[7];
        sign4<=sign3;
        
       add16[0]<=add8[0]+add8[1];
       add16[1]<=add8[2]+add8[3];
       sign5<=sign4;
       
       temp<=add16[0]+add16[1];   
       sign<=sign5;
     end
     end
     assign z=sign?(~temp+1'b1):temp;
endmodule*/
