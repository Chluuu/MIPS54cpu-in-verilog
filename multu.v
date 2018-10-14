`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/20 21:25:08
// Design Name: 
// Module Name: MULTU
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


module MULTU(
  //  input clk,
  //  input reset,
    input [31:0] a, // 输入 a(被乘数) 
    input [31:0] b, // 输入 b(乘数) 
    output [63:0] z // 乘积输出 z 
    );
    assign z=a*b;
  //    申请寄存器     
  /* reg [63:0] temp; 
   reg [63:0]stored[31:0];
   reg [63:0]add2[15:0];
   reg [63:0]add4[7:0];
   reg [63:0]add8[3:0];
   reg [63:0]add16[1:0]; 
    
   integer i;
    
    always@(posedge clk or negedge reset)
    begin
      // reset          
      if(reset) begin 
          temp<=0;
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
         //通过字符拼接方式表示出中间相乘值，并相加            
      stored[0] <= b[0]? {32'b0, a} :64'b0;
      stored[1] <= b[1]? {31'b0, a, 1'b0} :64'b0;
      stored[2] <= b[2]? {30'b0, a, 2'b0} :64'b0;
      stored[3] <= b[3]? {29'b0, a, 3'b0} :64'b0;
      stored[4] <= b[4]? {28'b0, a, 4'b0} :64'b0;
      stored[5] <= b[5]? {27'b0, a, 5'b0} :64'b0;
      stored[6] <= b[6]? {26'b0, a, 6'b0} :64'b0;
      stored[7] <= b[7]? {25'b0, a, 7'b0} :64'b0;
      stored[8] <= b[8]? {24'b0, a, 8'b0} :64'b0;
      stored[9] <= b[9]? {23'b0, a, 9'b0} :64'b0;
      stored[10] <= b[10]? {22'b0, a, 10'b0} :64'b0;
      stored[11] <= b[11]? {21'b0, a, 11'b0} :64'b0;
      stored[12] <= b[12]? {20'b0, a, 12'b0} :64'b0;
      stored[13] <= b[13]? {19'b0, a, 13'b0} :64'b0;
      stored[14] <= b[14]? {18'b0, a, 14'b0} :64'b0;
      stored[15] <= b[15]? {17'b0, a, 15'b0} :64'b0;
      stored[16] <= b[16]? {16'b0, a, 16'b0} :64'b0;
      stored[17] <= b[17]? {15'b0, a, 17'b0} :64'b0;
      stored[18] <= b[18]? {14'b0, a, 18'b0} :64'b0;
      stored[19] <= b[19]? {13'b0, a, 19'b0} :64'b0;
      stored[20] <= b[20]? {12'b0, a, 20'b0} :64'b0;
      stored[21] <= b[21]? {11'b0, a, 21'b0} :64'b0;
      stored[22] <= b[22]? {10'b0, a, 22'b0} :64'b0;
      stored[23] <= b[23]? {9'b0, a, 23'b0} :64'b0;
      stored[24] <= b[24]? {8'b0, a, 24'b0} :64'b0;
      stored[25] <= b[25]? {7'b0, a, 25'b0} :64'b0;
      stored[26] <= b[26]? {6'b0, a, 26'b0} :64'b0;
      stored[27] <= b[27]? {5'b0, a, 27'b0} :64'b0;
      stored[28] <= b[28]? {4'b0, a, 28'b0} :64'b0;
      stored[29] <= b[29]? {3'b0, a, 29'b0} :64'b0;
      stored[30] <= b[30]? {2'b0, a, 30'b0} :64'b0;
      stored[31] <= b[31]? {1'b0, a, 31'b0} :64'b0;
      
    
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
      
      add4[0]<=add2[0]+add2[1];
      add4[1]<=add2[2]+add2[3];
      add4[2]<=add2[4]+add2[5];
      add4[3]<=add2[6]+add2[7];
      add4[4]<=add2[8]+add2[9];
      add4[5]<=add2[10]+add2[11];
      add4[6]<=add2[12]+add2[13];
      add4[7]<=add2[14]+add2[15];
      
      add8[0]<=add4[0]+add4[1];
      add8[1]<=add4[2]+add4[3];
      add8[2]<=add4[4]+add4[5];
      add8[3]<=add4[6]+add4[7];
      
      add16[0]<=add8[0]+add8[1];
      add16[1]<=add8[2]+add8[3];
      
      temp<=add16[0]+add16[1];   

    end
    end
    assign z=temp;*/
endmodule
