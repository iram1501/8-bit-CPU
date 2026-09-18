`timescale 1ns / 1ps
module or8b(
    input [7:0] a, b, 
    output [7:0] y
    );
    
    or_nand g0 (
        .a(a[0]),
        .b(b[0]),
        .y(y[0])
    );
    
    or_nand g1 (
        .a(a[1]),
        .b(b[1]),
        .y(y[1])
    );
    
    or_nand g2 (
        .a(a[2]),
        .b(b[2]),
        .y(y[2])
    );
    
    or_nand g3 (
        .a(a[3]),
        .b(b[3]),
        .y(y[3])
    );
    
    or_nand g4 (
        .a(a[4]),
        .b(b[4]),
        .y(y[4])
    );
    
    or_nand g5 (
        .a(a[5]),
        .b(b[5]),
        .y(y[5])
    );
    
    or_nand g6 (
        .a(a[6]),
        .b(b[6]),
        .y(y[6])
    );
    
    or_nand g7 (
        .a(a[7]),
        .b(b[7]),
        .y(y[7])
    );
    
endmodule
