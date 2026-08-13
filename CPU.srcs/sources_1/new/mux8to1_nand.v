`timescale 1ns / 1ps
module mux8to1_nand(
    input wire i0, i1, i2, i3, i4, i5, i6, i7,
    input wire [2:0] s, 
    output y
    );
    
    wire mux1, mux2;
    
    mux4to1_nand m0 (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s[1:0]),
        .y(mux1)
    );
    
    mux4to1_nand m1 (
        .i0(i4),
        .i1(i5),
        .i2(i6),
        .i3(i7),
        .s(s[1:0]),
        .y(mux2)
    );
    
    mux2to1_nand m2 (
        .i0(mux1),
        .i1(mux2),
        .s(s[2]),
        .y(y)
    );
    
endmodule
