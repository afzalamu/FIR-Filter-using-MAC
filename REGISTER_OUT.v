`timescale 1ns / 1ps

module REGISTER_OUT(out,din,reset,clk);

input [7:0]din;
output reg [7:0]out;
input clk,reset;

always @(posedge clk) begin 
    if(reset)
        begin
        out <=8'h00;
        end
        else out<=din;
end
endmodule

