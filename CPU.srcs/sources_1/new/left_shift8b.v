`timescale 1ns / 1ps
module left_shift8b(
    input [7:0] a,
    output [7:0] y
    );
    
    wire not_a0, not_a1, not_a2, not_a3, 
         not_a4, not_a5, not_a6;
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
    
    not_nand na3 (
        .a(a[3]),
        .not_a(not_a3)
    );
    
    nand(y[4], not_a3, not_a3);
    
    not_nand na4 (
        .a(a[4]),
        .not_a(not_a4)
    );
    
    nand(y[5], not_a4, not_a4);
    
    not_nand na5 (
        .a(a[5]),
        .not_a(not_a5)
    );
    
    nand(y[6], not_a5, not_a5);
    
    not_nand na6 (
        .a(a[6]),
        .not_a(not_a6)
    );
    
    nand(y[7], not_a6, not_a6);
    
endmodule
