module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge // To cut all intermediary registers, we make the pedge output a register itself
);
    // After consulting with gemini. I found this to be the better and faster solution
    reg [7:0] cont;
    
    assign pedge = out2;
    always @(posedge clk)begin
        in <= cont;

        pedge <= in & ~cont;
    end
endmodule
