module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    always @(*)begin
        if ({c,d} == 2'b00) {mux_in[0], mux_in[1], mux_in[3], mux_in[2]} = 4'b0001;
        else if ({c,d} == 2'b01) {mux_in[0], mux_in[1], mux_in[3], mux_in[2]} = 4'b1000;
        else if ({c,d} == 2'b11) {mux_in[0], mux_in[1], mux_in[3], mux_in[2]} = 4'b1010;
        else if ({c,d} == 2'b10) {mux_in[0], mux_in[1], mux_in[3], mux_in[2]} = 4'b1001;
    end
endmodule
