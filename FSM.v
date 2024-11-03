`timescale 1ns / 1ps

module FSM(reset,ld1,ld2,wr,add_ram,add_rom,clk,global_reset);
input clk;
input global_reset;
output reg reset;
output reg ld1,ld2;
output reg wr;
output reg [1:0] add_ram;
output reg [1:0] add_rom;

    localparam S0 = 5'd0;
    localparam S1 = 5'd1;
    localparam S2 = 5'd2;
    localparam S3 = 5'd3;
    localparam S4 = 5'd4;
    localparam S5 = 5'd5;
    localparam S6 = 5'd6;
    localparam S7 = 5'd7;
    localparam S8 = 5'd8;
    localparam S9 = 5'd9;
    localparam S10 = 5'd10;
    localparam S11 = 5'd11;
    localparam S12 = 5'd12;
    localparam S13 = 5'd13;
    localparam S14 = 5'd14;
    localparam S15 = 5'd15;
    localparam S16 = 5'd16;
    localparam S17 = 5'd17;
    
    reg [4:0] NS;
    reg [4:0] PS; 
    
    always@(posedge clk or posedge global_reset )
    begin
        if(global_reset)
            begin
            PS<=S0;
            end
        else
            begin
            PS<=NS;
            end
    end
    
    always@(PS)
    begin 
    reset = 0;
    ld1 = 0;
    ld2 = 0;
    wr = 0;
    add_ram = 2'd0;
    add_rom = 2'd0;
    case(PS) 
    
    S0 : begin reset = 1; wr = 1; ld1 = 0; ld2 = 0; add_ram = 2'd0;  NS = S1;   end
    
    S1 : begin wr = 1;reset = 1;  ld1 = 0; ld2 = 0;  add_ram = 2'd1; NS =S2; end 
    
    S2 : begin wr = 1; reset = 1;  ld1 = 0; ld2 = 0;add_ram = 2'd2; NS =S3;  end 
    
    S3 : begin wr = 0; add_ram = 2'd0; add_rom = 2'd0;  ld1 = 1; ld2 =1 ; reset = 1 ; NS = S4;  end 
    
    S4 : begin wr = 0; add_ram = 2'd0;add_rom = 2'd0;  ld1 = 0; ld2 = 0; NS =S5; reset = 0;  end 
    
    S5 : begin wr = 0;  reset = 1; add_ram = 2'd1; add_rom = 2'd0;  ld1 = 1; ld2 =1 ;  NS =S6;   end 
    
    S6 : begin wr = 0; add_ram = 2'd0; add_rom = 2'd1; reset = 0;  ld1 = 1; ld2 = 1; NS =S7;  end 
    
   S7 : begin wr = 0;  NS = S8;  ld1 = 0; ld2 = 0; reset = 0;  end 
    
    S8 : begin wr = 0; reset = 1; add_ram = 2'd2; add_rom = 2'd0;   ld1 = 1; ld2 = 1; NS = S9;  end 
    
    S9 : begin wr = 0;  add_rom = 2'd1; add_ram = 2'd1; ld1 = 1; ld2 = 1; NS = S10;  reset =0; end 
    
    S10 : begin wr = 0; add_ram = 2'd0; add_rom = 2'd2; ld1 = 1; ld2 = 1; NS = S11; reset =0;end 
    
    S11 : begin wr = 0; add_ram = 2'd0;  ld1 = 0; ld2 = 0; NS = S12;reset =0; end 
    
    S12 : begin wr = 0; reset = 1; add_rom =2'd1; add_ram = 2'd2;  ld1 = 1; ld2 = 1 ;  NS =S13;  end 
    
    S13 : begin wr = 0; reset =0;  add_rom = 2'd2; add_ram = 2'd1;  ld1 = 1; ld2 = 1; NS =S14;  end 
    
   S14 : begin wr = 0; add_ram = 2'd0;  ld1 = 0; ld2 = 0; NS =S15; reset =0; end 
    
    S15 : begin wr = 0; reset =1; add_rom = 2'd2; add_ram = 2'd2; ld1 = 1; ld2 = 1;  NS =S16; end 
    
    S16 : begin wr = 0; reset = 0; add_ram = 2'd0; ld1 = 0; ld2 = 0; NS =S0; end 
    
    
    endcase        
    end
    
endmodule








