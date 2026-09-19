module top_module( output one );
// Insert your code here
    assign one = 1;
  // The 'assign' here is a keyword meant to inroduce a continuous assignment operation.
  // Here, 'one' is an output wire and we're assigning the value 1 to it within the module.
  // As you will see, it is better to use 1'b1 which is sized literal number constant notation.
  // 3'd4 means we have 3 bits representing the decimal number 4
endmodule
