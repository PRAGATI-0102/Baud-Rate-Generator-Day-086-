`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 10:03:58 PM
// Design Name: 
// Module Name: baud_rate_gen
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


module braud_rate_gen(clockout,clk,reset,sel);
        input [1:0]sel;
        input clk,reset;
        output reg clockout=0;
        reg[11:0]modulus=12'd0;
        reg[11:0]count=0;
        
        always@(sel)
        begin
            case(sel)
                2'b00:modulus=12'd1303;
                2'b01:modulus=12'd325;
                2'b10:modulus=12'd162;
                2'b11:modulus=12'd64;
                default:modulus=12'd325;
            endcase
        end
        
        always@(posedge clk,negedge reset)
        begin
            if (!reset)
                begin
                    clockout<=0;
                end
            else if(count==modulus)
                begin
                    count=0;
                    clockout<=~clockout;
                end
            else
                begin
                    count=count+1;
                    clockout<=clockout;
                end
        end

endmodule
