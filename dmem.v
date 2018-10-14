`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/14 22:24:22
// Design Name: 
// Module Name: dmem
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


module dmem(
        input clk,
        input d_ram_wena,
        input [31:0] daddr,
        input [31:0] data_in,
        output  [31:0] data_out
        
        );
 //reg [31:0] drom [31:0];
                
    /*          always@(*)
                begin
                case(daddr%4)
                0:data_out = drom[daddr/4];
                1:data_out = {drom[daddr/4+1][7:0],drom[daddr/4][31:8]};
                2:data_out = {drom[daddr/4+1][15:0],drom[daddr/4][31:16]};
                3:data_out={drom[daddr/4+1][23:0],drom[daddr/4][31:24]};
                 default:;
                 endcase
                 end
            //    assign data_out = drom[daddr/4];
                always @ (negedge clk)
                begin
                        if (d_ram_wena == 1)
                            //  drom[daddr/4]<=data_in;  
                            begin
                        case(daddr%4)
                        0:drom[daddr/4]=data_in;
                        1:{drom[daddr/4+1][7:0],drom[daddr/4][31:8]}=data_in;
                        2:{drom[daddr/4+1][15:0],drom[daddr/4][31:16]}=data_in;
                        3:{drom[daddr/4+1][23:0],drom[daddr/4][31:24]}=data_in;
                        default:;
                        endcase
                        end
                end
        
                     
        endmodule   */
 reg [31:0] state [0:512];
    always@(posedge clk) begin
        if(d_ram_wena) begin
            if(daddr!=0) state[daddr]<=data_in;
        end
    end 

    assign data_out=state[daddr];
endmodule