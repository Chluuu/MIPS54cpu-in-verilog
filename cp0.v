`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/14 22:27:24
// Design Name: 
// Module Name: cp0
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


module CP0(
        input clk,
        input rst,
        input teq_exc,
        input mtc0,            //CPU instruction is Mtc0
        input [31:0] pc,
        input [4:0] addr,        //Specifies CP0 register
        input [31:0] wdata,    //Data from GP register to replace CP0 register
        input eret,            //instruction is ERET(Exception Return)
        input [3:0] cause,
        output [31:0] rdata,    //Data from CP0 register for GP register,
        output [31:0] exc_addr    //Address for PC at the beginning of an exception
    );
    
    parameter    SYSCALL     =   4'b1000,
                BREAK       =   4'b1001,
                TEQ            =   4'b1101,
                IE            =    0;
//                status    =    12,
//                cause        =    13,
//                epc        =    14,    
                
    reg [31:0] cop0 [0:31];
    wire [31:0] status    =    cop0[12];
    integer i;
    
    wire exception    =    status[0]&&    ((status[1]&&cause==SYSCALL)||
                                     (status[2]&&cause==BREAK)    ||
                                     (status[3]&&cause==TEQ&&teq_exc));
    
    always@(posedge clk or posedge rst) begin
        if(rst)begin
            for(i=0;i<32;i=i+1)
                cop0[i]<=0;
        end
        else begin
            if(mtc0)
                cop0[addr]    <=    wdata;
            else if(exception)begin
                cop0[14]    <=    pc;
                cop0[12]    <=    status<<5;
                cop0[13]    <=    {24'b0,cause,2'b0};
            end
            else if(eret) begin
                cop0[12]    <=    status>>5;
            end
        end 
    end
    assign exc_addr    =    eret?cop0[14]:32'h00400004;
    assign rdata    =    cop0[addr];
    
endmodule
