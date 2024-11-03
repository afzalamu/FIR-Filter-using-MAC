`timescale 1ns / 1ps

module ROM(out,add_rom);

input [1:0] add_rom;
output [7:0] out;

reg [7:0] out;


always@(*)
    begin
    case(add_rom)
        2'b00: out<=8'h10;
        2'b01: out<=8'hC0;
        2'b10: out<=8'h20;
        endcase 
            end

endmodule
