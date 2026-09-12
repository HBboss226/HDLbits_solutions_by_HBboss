module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    // Here, I'm declaring my registers and loop variable. The can1 is short for my container of past values. out1 serves
    //as a register to store the output but delay it by one clock cycle before it gets to out2 which is the real output
    // because out2 is continiuosly assigned to pedge(teh output wire) 
    reg [7:0] can1, out1, out2;
    integer i;
    
    assign pedge = out2;
    always @(posedge clk)begin
        can1 <= in;
        out2 <= out1;
        for (i=0 ; i < 8 ; i++)begin
            if ((in[i]) & (!can1[i]))  out1[i] <= 1;
            else if ((in[i]) & (can1[i])) out2[i] <= 0; // here, out2 is changed directly. if not, the output of 0 would be delayed by one clock cycle
            else out2[i] <= 0;
        end
    end

endmodule
