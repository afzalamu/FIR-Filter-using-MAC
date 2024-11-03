`timescale 1ns / 1ps

module FILTER_TOP(out,xn,clk,global_reset);
output [7:0] out;
input [7:0] xn;
input global_reset,clk;

wire [7:0] p,q,r,s,t,u;
wire [1:0] reset,ld1,ld2,wr;
wire [1:0] add_rom;
wire [1:0] add_ram;
wire [7:0] data_out;
wire [7:0] data_out_ram;

FSM controller(reset,ld1,ld2,wr,add_ram,add_rom,clk,global_reset);
ROM RO1 (p,add_rom);
RAM RA1 (q,xn,clk,wr,add_ram);
REGISTER R1 (r,p,clk,ld1);
REGISTER R2 (s,q,clk,ld2);
MULTIPLIER M1 (t,r,s);
ADDER A1(u,t,out);
REGISTER_OUT R3(out,u,reset,clk);

endmodule
