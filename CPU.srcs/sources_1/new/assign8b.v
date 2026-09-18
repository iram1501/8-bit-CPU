`timescale 1ns / 1ps
module assign8b(
    input  [7:0] a,
    output [7:0] y
    );
    
    wire one;
    wire na0;
    not_nand one0 (.a(a[0]), .not_a(na0));
    or_nand one1 (.a(a[0]), .b(na0), .y(one));
    
    and_nand a0 (.a(one), .b(a[0]), .y(y[0]));
    and_nand a1 (.a(one), .b(a[1]), .y(y[1]));
    and_nand a2 (.a(one), .b(a[2]), .y(y[2]));
    and_nand a3 (.a(one), .b(a[3]), .y(y[3]));
    and_nand a4 (.a(one), .b(a[4]), .y(y[4]));
    and_nand a5 (.a(one), .b(a[5]), .y(y[5]));
    and_nand a6 (.a(one), .b(a[6]), .y(y[6]));
    and_nand a7 (.a(one), .b(a[7]), .y(y[7]));
    
    
endmodule
