module top_module (
    input clk, reset,
    input [31:0] in,
    output reg [31:0] out
);
    //integer i; Wanted to try looping. Turns out I didn't need it
    reg [31:0] cont;
    
    always @(posedge clk)begin
        cont <= in;
        if (!reset) out <= (cont & ~in) | out;
        else if (reset) out <= 32'b0;
        else out <= out;
    end
  //This one was a bit tricky. Didn't use AI though. What I did was draw a truth table of the 
  //data in cont, in and out-(the data currently in the output register at that cycle instant)
  // The first term (cont & ~in) is the 1 output when cont is zero and in is one
  //The second term is the 'or' term that essentially toggles the present and the past
endmodule
