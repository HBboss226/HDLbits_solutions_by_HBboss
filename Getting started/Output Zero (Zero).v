module top_module(
    output zero
);// Module body starts after semicolon
    assign zero = 0;
    // I don't usually use the sized integer notation(1'b1) for 1 and 0 if it's a single wire.
endmodule
