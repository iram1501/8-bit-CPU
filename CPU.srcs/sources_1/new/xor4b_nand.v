`timescale 1ns / 1ps
module xor4b_nand(
    input wire [3:0] a, b, 
    output wire [3:0] y
    );
    
    xor_nand g0 (
        .a(a[0]),
        .b(b[0]),
        .y(y[0])
    );
    
    xor_nand g1 (
        .a(a[1]),
        .b(b[1]),
        .y(y[1])
    );
    
    xor_nand g2 (
        .a(a[2]),
        .b(b[2]),
        .y(y[2])
    );
    
    xor_nand g3 (
        .a(a[3]),
        .b(b[3]),
        .y(y[3])
    );
    
endmodule
