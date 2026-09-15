module top_module (
    input clk, reset,
    output reg [3:0] q);
    always @ (posedge clk)begin
        if ((!reset) & (q < 4'd10))  q <= q + 4'b1;
        else q <= 1;
    end
endmodule
