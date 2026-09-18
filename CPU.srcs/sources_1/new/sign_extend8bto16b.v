`timescale 1ns / 1ps
module sign_extend8bto16b(
    input [7:0] a,
    output [15:0] y
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
    
    and_nand a8  (.a(one), .b(a[7]), .y(y[8]));
    and_nand a9  (.a(one), .b(a[7]), .y(y[9]));
    and_nand a10 (.a(one), .b(a[7]), .y(y[10]));
    and_nand a11 (.a(one), .b(a[7]), .y(y[11]));
    and_nand a12 (.a(one), .b(a[7]), .y(y[12]));
    and_nand a13 (.a(one), .b(a[7]), .y(y[13]));
    and_nand a14 (.a(one), .b(a[7]), .y(y[14]));
    and_nand a15 (.a(one), .b(a[7]), .y(y[15]));
    
    
    
endmodule
