`timescale 1ns / 1ps
module mux4to1_nand(
    input wire i0, i1, i2, i3,
    input wire [1:0] s,
    output wire y
    );
    
    wire out_i0i1, out_i2i3;
    
    mux2to1_nand i0i1 (
        .i0(i0),
        .i1(i1),
        .s(s[0]),
        .y(out_i0i1)
    );
    
    mux2to1_nand i2i3 (
        .i0(i2),
        .i1(i3),
        .s(s[0]),
        .y(out_i2i3)
    );
    
    mux2to1_nand n0 (
        .i0(out_i0i1),
        .i1(out_i2i3),
        .s(s[1]),
        .y(y)
    );
    
endmodule
