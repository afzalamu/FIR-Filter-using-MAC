`timescale 1ns / 1ps

module RAM(out,din,clk,wr,add_ram);
output [7:0] out;
input  [1:0] add_ram;
input  [7:0] din;
input clk,wr;

reg [7:0] MEM[2:0];

always @(posedge clk) begin
    if (wr) begin
        MEM[add_ram] <= din;    // Write data to memory at address `add`
    end
end

assign out= MEM[add_ram];

endmodule