module top_module (
    input clk, reset, enable,
    output [3:0] Q,c_d,
    output c_enable, c_load
); // This was a very difficult question. Maybe cos it's been a while I worked with modules
  //I solved by understanding that we're not supposed to do any work, the 4 bit counter is the one that will do the heavy lifting 
	assign c_enable = enable; 
  assign c_load = reset | ( (Q[3] & Q[2] & ~Q[1] & ~Q[0]) & enable);
  // or you can write this line as 
  //assign c_load = reset | (Q == 4'd12 & enable);
  assign c_d = c_load;
  count4 the_counter (clk, c_enable, c_load, c_d, Q);
  // The clk as we know is teh clock. 
  //c_enable is the signal that when set high allows the counter to continue, so we simply route the enable coming into the top_module to the enable pin of the 
  // count4 module which is dubbed c_enable
  //c_d is teh value that the counter will be set to as soon as c_load is set high 
endmodule
