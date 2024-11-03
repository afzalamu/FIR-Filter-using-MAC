# Design and FPGA Implementation of FIR Filter using MAC (Multiplier-Accumulator) on FPGA (Artix 7)

## Block Diagram
![WhatsApp Image 2024-11-03 at 18 56 33_098156e4](https://github.com/user-attachments/assets/588239f1-ed55-403d-8eff-1f6b15d18eee)

## Calculations
![WhatsApp Image 2024-11-03 at 18 56 44_168606c3](https://github.com/user-attachments/assets/b858a488-93a2-4294-afe8-2390c8b7ca86)

## VERILOG CODES 
- First Create a New project and then create the following design sources.
  
![image](https://github.com/user-attachments/assets/f3a863d8-21c1-4064-9951-301f0523c0d8)

![image](https://github.com/user-attachments/assets/07c64d44-375e-478f-87f2-be062860ea2b)

![image](https://github.com/user-attachments/assets/8d862878-7e77-43df-9941-de654c360a56)

![image](https://github.com/user-attachments/assets/63b5952b-0a75-42ad-a0ed-4fb09ccbef74)

![image](https://github.com/user-attachments/assets/758edef4-eac6-494d-83f2-8af4f70133cd)

![image](https://github.com/user-attachments/assets/f495f72b-cb0e-44a9-85c8-9f791b522e54)

Also Create FSM Design:
```
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
```








