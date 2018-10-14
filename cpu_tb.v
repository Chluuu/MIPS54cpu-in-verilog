`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/30 12:16:57
// Design Name: 
// Module Name: cpu_tb
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


module sccomp_dataflow_tb;
   reg clk;
   reg reset;
   wire[31:0]tinst;
   wire[31:0]tpc;
   wire[31:0]addr;
   wire [15:0]sw=16'h8000;
         wire [7:0] o_seg;
          wire [7:0] o_sel;
   integer file_output;
  wire [31:0]tregdata;
initial begin
clk=0;
reset=1;
file_output=$fopen("D:/result.txt");
#1
reset=0;
end

always begin
#1
clk=~clk;
end
/*begin
  if(counter==10000)begin
   $fclose(file_output);
   end
   else counter=counter+1;*/ 
always@(posedge clk)
begin 

$fdisplay(file_output,"pc:%h",tpc);
$fdisplay(file_output,"instr:%h",tinst);

$fdisplay(file_output,"regfile0:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[0]);
$fdisplay(file_output,"regfile1:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[1]);
$fdisplay(file_output,"regfile2:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[2]);
$fdisplay(file_output,"regfile3:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[3]);
$fdisplay(file_output,"regfile4:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[4]);
$fdisplay(file_output,"regfile5:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[5]);
$fdisplay(file_output,"regfile6:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[6]);
$fdisplay(file_output,"regfile7:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[7]);
$fdisplay(file_output,"regfile8:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[8]);
$fdisplay(file_output,"regfile9:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[9]);
$fdisplay(file_output,"regfile10:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[10]);
$fdisplay(file_output,"regfile11:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[11]);
$fdisplay(file_output,"regfile12:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[12]);
$fdisplay(file_output,"regfile13:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[13]);
$fdisplay(file_output,"regfile14:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[14]);
$fdisplay(file_output,"regfile15:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[15]);
$fdisplay(file_output,"regfile16:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[16]);
$fdisplay(file_output,"regfile17:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[17]);
$fdisplay(file_output,"regfile18:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[18]);
$fdisplay(file_output,"regfile19:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[19]);
$fdisplay(file_output,"regfile20:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[20]);
$fdisplay(file_output,"regfile21:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[21]);
$fdisplay(file_output,"regfile22:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[22]);
$fdisplay(file_output,"regfile23:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[23]);
$fdisplay(file_output,"regfile24:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[24]);
$fdisplay(file_output,"regfile25:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[25]);
$fdisplay(file_output,"regfile26:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[26]);
$fdisplay(file_output,"regfile27:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[27]);
$fdisplay(file_output,"regfile28:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[28]);
$fdisplay(file_output,"regfile29:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[29]);
$fdisplay(file_output,"regfile30:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[30]);
$fdisplay(file_output,"regfile31:%h",sccomp_dataflow_tb.uut.cpu_ref.array_reg[31]);

end
//end
wire [31:0]rd1;
wire [31:0]ra;

wire [31:0]wd;
wire seg7;
wire sw7;
sccomp_dataflow uut(
 .clk_in(clk),
 .reset(reset),
 .sw(sw),
 .o_seg(o_seg),
 .o_sel(o_sel),
 .tinst(tinst),
 .tpc(tpc)
 //.wd(wd),
// .rd1(rd1),
// .ra(ra),
// .tregdata(tregdata),
// .inst(inst),
 // .pc(pc)
// .addr(addr)
//.seg7(seg7),
//.sw7(sw7)
);
endmodule
