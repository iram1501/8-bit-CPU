`timescale 1ns / 1ps
module xnor8b(
    input  [7:0] a, b, 
    output [7:0] y
    );
    
    xnor_nand n0 (
        .a(a[0]),
        .b(b[0]),
        .y(y[0])
    );
    
    xnor_nand n1 (
        .a(a[1]),
        .b(b[1]),
        .y(y[1])
    );
    
    xnor_nand n2 (
        .a(a[2]),
        .b(b[2]),
        .y(y[2])
    );
    
    xnor_nand n3 (
        .a(a[3]),
        .b(b[3]),
        .y(y[3])
    );
    
    xnor_nand n4 (
        .a(a[4]),
        .b(b[4]),
        .y(y[4])
    );
    
    xnor_nand n5 (
        .a(a[5]),
        .b(b[5]),
        .y(y[5])
    );
    
    xnor_nand n6 (
        .a(a[6]),
        .b(b[6]),
        .y(y[6])
    );
    
    xnor_nand n7 (
        .a(a[7]),
        .b(b[7]),
        .y(y[7])
    );
    
endmodule
