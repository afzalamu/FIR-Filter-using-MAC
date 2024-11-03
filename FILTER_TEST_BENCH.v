`timescale 1ns / 1ps

module FILTER_TEST_BENCH();

reg [7:0] xn;

reg clk, global_reset;

wire [7:0] out;

FILTER_TOP dut(out,xn,clk,global_reset);
 
initial begin
    clk=1'b0;
 end
always #5 clk=~clk;

initial begin
global_reset = 1'b1;
xn=8'h20;
#3 global_reset = 1'b0;
#7 xn=8'h10;
#10 xn=8'h08;
#200 $finish;
end
endmodule

