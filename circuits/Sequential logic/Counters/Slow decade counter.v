module top_module (
    input clk, slowena, reset,
    output reg [3:0] q);
	always @ (posedge clk)begin
        if (reset) q <= 4'b0;
        else if (!slowena) q <= q;
        else if (q < 4'd9)  q <= q + 4'b1;
        else q <= 0;
    end
endmodule
