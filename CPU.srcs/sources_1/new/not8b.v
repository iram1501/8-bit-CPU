`timescale 1ns / 1ps
module not8b(
    input [7:0] a,
    output [7:0] not_a
    );
    
    nand(not_a[0], a[0], a[0]);
    nand(not_a[1], a[1], a[1]);
    nand(not_a[2], a[2], a[2]);
    nand(not_a[3], a[3], a[3]);
    nand(not_a[4], a[4], a[4]);
    nand(not_a[5], a[5], a[5]);
    nand(not_a[6], a[6], a[6]);
    nand(not_a[7], a[7], a[7]);
    
endmodule
