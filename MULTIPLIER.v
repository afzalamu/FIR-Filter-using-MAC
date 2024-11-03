`timescale 1ns / 1ps

module MULTIPLIER(out,a,b);
output signed [7:0] out;
input signed  [7:0] a,b;
wire [15:0]temp;
assign temp =a*b;
assign out = temp[14:7];
endmodule