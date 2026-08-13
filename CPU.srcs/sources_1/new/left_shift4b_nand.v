`timescale 1ns / 1ps
module left_shift4b_nand(
    input  wire [3:0] a, 
    output wire [3:0] y
    );
    
    wire not_a0, not_a1, not_a2;
    wire one;
    
    not_nand na0 (
        .a(a[0]),
        .not_a(not_a0)
    );
    
    nand(one, not_a0, a[0]);
    nand(y[0], one, one);
    
    nand(y[1], not_a0, not_a0);
    
    not_nand na1 (
        .a(a[1]),
        .not_a(not_a1)
    );
    
    nand(y[2], not_a1, not_a1);
    
    not_nand na2 (
        .a(a[2]),
        .not_a(not_a2)
    );
    
    nand(y[3], not_a2, not_a2);
    
endmodule
