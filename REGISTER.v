`timescale 1ns / 1ps

module REGISTER(out,din,clk,ld);
input [7:0]din;
output reg [7:0]out;
input clk,ld;

always @(posedge clk) begin
    if (ld) 
        out <= din;
end
endmodule

