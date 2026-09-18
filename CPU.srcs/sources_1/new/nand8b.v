`timescale 1ns / 1ps
module nand8b(
    input  [7:0] a, b,
    output [7:0] y
    );
    
    nand(y[0], a[0], b[0]);
    nand(y[1], a[1], b[1]);
    nand(y[2], a[2], b[2]);
    nand(y[3], a[3], b[3]);
    nand(y[4], a[4], b[4]);
    nand(y[5], a[5], b[5]);
    nand(y[6], a[6], b[6]);
    nand(y[7], a[7], b[7]);
    
endmodule
