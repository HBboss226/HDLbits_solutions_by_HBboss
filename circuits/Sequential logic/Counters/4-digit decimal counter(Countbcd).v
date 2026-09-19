module HBDC (
    input clk, reset, ena,      // Synchronous active-high reset
    output [3:0] q);
    reg [3:0] mem;
    assign q = mem;
    always @(posedge clk)begin
        if (reset) mem <= 4'd0;
        else if (ena) begin
            if (mem == 4'd9) mem <= 4'd0;
            else mem <= mem + 4'd1;
        end
    end
endmodule
// This is teh longest stretch of verilog I've written thus far. I'll add a formal explanation soon cos truth be told
//I solved this with teh grace of my ancestors
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output [15:0] q);
     
    reg [3:0] a0, a1, a2, a3;
    wire sw1, sw2, sw3;
    
    HBDC adder1 (clk, reset, 1, a0);
    HBDC adder2 (clk, reset, sw1, a1);
    HBDC adder3 (clk, reset, sw2, a2);
    HBDC adder4 (clk, reset, sw3, a3);
    
    assign q = {a3, a2, a1, a0};
    assign sw1 = (a0 == 4'd9);
    assign sw2 = (a1 == 4'd9) & (a0 == 4'd9);
    assign sw3 = (a2 == 4'd9) & (a1 == 4'd9) & (a0 == 4'd9);
    assign ena = {(a2 == 4'd9)& (a1 == 4'd9) & (a0 == 4'd9), 
                  (a1 == 4'd9) & (a0 == 4'd9), 
                  (a0 == 4'd9)};
endmodule
