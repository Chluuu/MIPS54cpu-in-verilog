`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/14 22:19:34
// Design Name: 
// Module Name: sccpu
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

module sccomp_dataflow(
        input clk_in,
        input reset,
        input [15:0]sw,
        output [7:0] o_seg,
         output [7:0] o_sel
      //   output [31:0]tinst,
     //    output[31:0]tpc,
     //     output [31:0]wd,
      //    output [31:0] rd1,
      //    output [31:0] ra,
     ///   output [31:0] tp,
     ///   output [31:0]tinst
//     output [31:0]tregdata,
 //    output seg7,
 //    output sw7
   //  output [31:0]trdata
        );    
    wire clk;
    
 //   assign clk=clk_in;
   // clk_div #(3)cpu_clk(clk_in,clk);
//    wire [7:0] o_seg,AN;
    wire [31:0] instr,rdata1,rdata2;
    wire [31:0] pc;
 //   assign tp=pc;
    wire [31:0] reg_data;
    wire reg_wena,ram_wena,pc_ena;
    wire [31:0] ram_addr;
    
    wire [3:0] alu_op;

    wire [31:0] alu_r;
    wire [4:0] rs,rt,rd;
    
    wire [31:0] hi,lo,cop_data;
  
    parameter    ENA        =    1'b1;
    parameter     DIS        =    1'b0;
    
    wire [31:0] pc_in,alu_a,alu_b;
    wire [31:0] ram_data;
    wire [31:0] wdata,exc_addr;
    wire [31:0] mult_hi,mult_lo,div_hi,div_lo;
    wire [4:0] waddr;
    wire [3:0] cause;
    wire z,c,o,n;
    wire dm_cs;
    wire mtc0,eret;
    wire [2:0] mdu;

    wire [31:0] IRAdd =(pc-32'h00400000)>>2;
    wire [63:0] mul_out;
    wire [31:0] rdata;
//    wire [31:0] watch_out2=call_code;
    wire seg7_cs,teq_exc;
    
    wire scan_dir;
      
      wire switch_cs;
      //assign sw7=switch_cs;
       //  assign seg7=seg7_cs;
      //  assign tinst=instr;
    //  wire clk_25m;       //clocking输出50MHz
 //     assign tregdata=reg_data;
 //     assign trdata=rdata2;
  //    assign tpc=pc;
 //     assign tinst=instr;
 //     assign wd=wdata;
  //    assign rd1=rdata1;
  //    assign ra=alu_r;
      wire clk_locked;    //clocking输出完成标志位
           
      parameter add1=32'h10010010;
      parameter add2=32'h10010000;
 
      assign switch_cs = (ram_addr[8:0] ==add1[8:0] && dm_cs == 1 && ram_wena == 0) ? 1 : 0;
      assign seg7_cs = (ram_addr[8:0] == add2[8:0] && dm_cs == 1 && ram_wena == 1) ? 1 : 0;
      assign rdata=(switch_cs) ? {16'b0, sw} : ram_data;
      
   imem imem(IRAdd[10:0],instr);
 //  i_ram im(IRAdd,instr);
   myclk my(clk_in,clk,reset,clk_locked);
    pcreg pcreg(
        clk,
        reset,
        pc_ena,
        pc_in,
        pc);

    alu alu(
        alu_a,
        alu_b,
        alu_op,
        alu_r,
        z,c,n,o);
          
    RegFiles cpu_ref(
        clk,
        reset,
        reg_wena,
        rs,
        rt,
        waddr,
        wdata,
        rdata1,
        rdata2
        );
    
      CP0 CP0(
          clk,reset,teq_exc,mtc0,
          pc,
          rd,rdata2,
          eret,cause,
          cop_data,exc_addr);
     
      /*PORT (
              a : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
              d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
              clk : IN STD_LOGIC;
              we : IN STD_LOGIC;
              spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)*/
     /*  dmem dmem(
      ram_addr[10:0],
      reg_data,
      clk,
      ram_wena,
      ram_data);*/
     dmem dmem(
          ~clk,
          ram_wena,
          ram_addr-32'h10010000,
          reg_data,
          ram_data
        //  watch_out
          );
          
    
    seg7x16 seg7x16(
        clk,reset,
        seg7_cs,
        reg_data,
        o_seg,
        o_sel);
        
    HL HiLo(
        .mdu(mdu),
        .clk(clk),.reset(reset),
        .mul_out(mul_out),
        .rdata1(rdata1),.rdata2(rdata2),
        .hi(hi),.lo(lo),
        .pc_ena(pc_ena));
    
    control control(
        .instr(instr),
        .rdata1(rdata1),
        .rdata2(rdata2),
        .pc(pc),
        .clk(clk),
        .rdata(rdata),
        .mul_out(mul_out[31:0]),
        .rs(rs),.rt(rt),.rd(rd),
        .hi(hi),.lo(lo),
        .cop_data(cop_data),
        .exc_addr(exc_addr),
        .teq_exc(teq_exc),
        .mtc0(mtc0),.eret(eret),
        .mdu(mdu), 
        .cause(cause),
        .reg_wena(reg_wena),.ram_wena(ram_wena),
        .waddr(waddr),.ram_addr(ram_addr),
        .wdata(wdata),.reg_data(reg_data),
        .pc_in(pc_in),
        .alu_a(alu_a),.alu_b(alu_b),.alu_r(alu_r),
        .alu_op(alu_op),.dm_cs(dm_cs));
endmodule
