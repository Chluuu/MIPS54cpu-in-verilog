`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/14 22:28:12
// Design Name: 
// Module Name: HL
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


module HL(
        input clk,reset,
        input [2:0] mdu,
        input [31:0] rdata1,rdata2,
        output [63:0] mul_out,
        output reg pc_ena,
        output reg [31:0] hi,lo);
    
    wire div_start,divu_start,div_busy,divu_busy,div_over,divu_over;
    wire [63:0] mult_out,multu_out,div_out,divu_out;
    
    assign    mul_out    =    mult_out;
    /*
        1    mult
        2    multu
        3    div    
        4    divu
        5    mthi
        6    mtlo
    */
    //assign pc_ena=1'b1;
    
    always@(*)begin
        case(mdu)
            3'h3:    pc_ena    =    div_over ||mdu!=3'h3;
            3'h4:    pc_ena    =    divu_over||mdu!=3'h4;
            default:pc_ena    =    1'b1;
        endcase
    end
    
    assign    div_start    =    mdu==3'h3&&!div_busy;
    assign    divu_start    =    mdu==3'h4&&!divu_busy;
    
    always@(posedge clk or posedge reset)begin
        if(reset) begin
            hi<=32'b0;
            lo<=32'b0;
        end
        else begin
            case(mdu)
                3'h1:    {hi,lo}    <=    mult_out;
                3'h2:    {hi,lo}    <=    multu_out;
                3'h3:    {lo,hi}    <=    div_out;
                3'h4:    {lo,hi}    <=    divu_out;
                3'h5:    hi         <=    rdata1;
                3'h6:    lo        <=    rdata1;
            endcase
        end 
    end
    MUL MUL(
        .a(rdata1),
        .b(rdata2),
        .z(mult_out));
    
   MULTU MULTU(
        .a(rdata1),
        .b(rdata2),
        .z(multu_out));
    
    DIV1 DIV1(
        .dividend(rdata1),
        .divisor(rdata2),
        .start(div_start),
        .clock(clk),
        .reset(mdu!=3'h3),
        .q(div_out[63:32]),
        .r(div_out[31:0]),
        .busy(div_busy),
        .over(div_over) );
    
    DIVU1 DIVU1(
        .dividend(rdata1),
        .divisor(rdata2),
        .start(divu_start),
        .clock(clk),
        .reset(mdu!=3'h4),
        .q(divu_out[63:32]),
        .r(divu_out[31:0]),
         .busy(divu_busy),
        .over(divu_over)       );
endmodule