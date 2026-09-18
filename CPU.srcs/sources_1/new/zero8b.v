`timescale 1ns / 1ps
module zero8b(
    input a,
    output [7:0] y
    );
    
    wire na;
    wire one;
    
    not_nand n0 (.a(a), .not_a(na)); 
    nand(one, a, na);
        
    nand(y[0], one, one);
    nand(y[1], one, one);
    nand(y[2], one, one);
    nand(y[3], one, one);
    nand(y[4], one, one);
    nand(y[5], one, one);
    nand(y[6], one, one);
    nand(y[7], one, one);
    
endmodule
