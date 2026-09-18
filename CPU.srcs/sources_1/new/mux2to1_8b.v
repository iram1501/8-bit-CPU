`timescale 1ns / 1ps
module mux2to1_8b(
    input  [7:0] i0, i1,
    input        s,
    output [7:0] y
    );
    
    mux2to1_nand m0 (.i0(i0[0]), .i1(i1[0]), .s(s), .y(y[0]));
    mux2to1_nand m1 (.i0(i0[1]), .i1(i1[1]), .s(s), .y(y[1]));
    mux2to1_nand m2 (.i0(i0[2]), .i1(i1[2]), .s(s), .y(y[2]));
    mux2to1_nand m3 (.i0(i0[3]), .i1(i1[3]), .s(s), .y(y[3]));
    mux2to1_nand m4 (.i0(i0[4]), .i1(i1[4]), .s(s), .y(y[4]));
    mux2to1_nand m5 (.i0(i0[5]), .i1(i1[5]), .s(s), .y(y[5]));
    mux2to1_nand m6 (.i0(i0[6]), .i1(i1[6]), .s(s), .y(y[6]));
    mux2to1_nand m7 (.i0(i0[7]), .i1(i1[7]), .s(s), .y(y[7]));
    
endmodule
