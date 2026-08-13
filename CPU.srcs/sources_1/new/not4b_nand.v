`timescale 1ns / 1ps
module not4b_nand(
    input wire [3:0] a, 
    output wire [3:0] not_a
    );
    
    nand(not_a[0], a[0], a[0]);
    nand(not_a[1], a[1], a[1]);
    nand(not_a[2], a[2], a[2]);
    nand(not_a[3], a[3], a[3]);
    
endmodule
