`timescale 1ns / 1ps
module right_shift4b_nand(
    input  wire [3:0] a, 
    output wire [3:0] y
    );
    
    wire not_a1, not_a2, not_a3;
    wire one;
    
    not_nand na1 (
        .a(a[1]),
        .not_a(not_a1)
    );
    
    nand(y[0], not_a1, not_a1);
    
    not_nand na2 (
        .a(a[2]),
        .not_a(not_a2)
    );
    
    nand(y[1], not_a2, not_a2);
    
    not_nand na3 (
        .a(a[3]),
        .not_a(not_a3)
    );
    
    nand(y[2], not_a3, not_a3);
    
    nand(one, not_a3, a[3]);
    nand(y[3], one, one);
    
endmodule
