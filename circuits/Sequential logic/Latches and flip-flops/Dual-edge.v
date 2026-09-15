module top_module (
    input clk,
    input d,
    output q
);
    reg bin1, bin2;
    assign q = (bin1 & clk) | (bin2 & ~clk);
    always @ (posedge clk) bin1 <= d;
    always @ (negedge clk) bin2 <= d;    
endmodule
