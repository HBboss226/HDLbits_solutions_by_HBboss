module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    //First declare teh wires
    wire one, two, three, four;
    //Then the actual working code
    assign one = p1a & p1b & p1c;
    assign two = p2a & p2b;
    assign three = p2c & p2d;
    assign four = p1d & p1e & p1f;
    assign p2y = two | three;
    assign p1y = one | four;
    
endmodule
