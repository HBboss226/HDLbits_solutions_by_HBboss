module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge //Using the same trich from the 'Edge detect' problem
);
    reg [7:0] cont;
    always @(posedge clk)begin
        cont <= in;
        anyedge <= (~cont & in) | (cont & ~in);
    end

endmodule
