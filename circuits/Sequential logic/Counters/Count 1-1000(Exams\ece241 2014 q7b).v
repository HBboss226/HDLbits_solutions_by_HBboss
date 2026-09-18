module top_module (
    input clk, reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] a0, a1, a2;
    
    assign c_enable[0] = 1;
    bcdcount counter0 (clk, reset, c_enable[0], a0);
    assign c_enable[1] = (a0 == 4'd9);
    bcdcount counter1 (clk, reset, c_enable[1], a1);
    assign c_enable[2] = (a1 == 4'd9) & (a0 == 4'd9);
    bcdcount counter2 (clk, reset, c_enable[2], a2);
    assign OneHertz = (a2 == 4'd9) & (a1 == 4'd9) & (a0 == 4'd9);
    
    //Onehertz = clk3;

endmodule
