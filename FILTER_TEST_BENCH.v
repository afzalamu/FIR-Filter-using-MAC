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


//module FILTER_TEST_BENCH( ); 
//reg clk; 
//reg [7:0] xn; 
//reg global_reset; 
//wire [7:0] out; 
//integer i = 0; 
//FILTER_TOP dut(out,xn,clk,global_reset); 
//initial begin  
//xn=0; 
//clk = 0; 
//global_reset = 1; 
//#5 clk = ~clk; 
//#5 clk = ~clk; 
//xn = 8'b0_010_0000;     //0.25         
//for( i =0; i< 50; i=i+1) begin  
//#5 clk = ~clk; 
//case(i) 
//1 : begin xn = 8'b0_001_0000; end      
////0.125    
//3 : begin xn = 8'b0_000_1000;  end    //0.0625 
//5 : xn = 0; 
//endcase   
//end 
//$finish; 
//end 
//endmodule












