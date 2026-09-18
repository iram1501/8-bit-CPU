`timescale 1ns / 1ps
module mux16to1(
    input i0, i1, i2, i3, i4, i5, i6, 
          i7, i8, i9, i10, i11, i12, 
          i13, i14, i15,
    input [3:0] s,  
    output y    
    );
    
    wire mux1, mux2;
    
    mux8to1_nand m0 (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .s(s[2:0]),
        .y(mux1)
    );
    
    mux8to1_nand m1 (
        .i0(i8),
        .i1(i9),
        .i2(i10),
        .i3(i11),
        .i4(i12),
        .i5(i13),
        .i6(i14),
        .i7(i15),
        .s(s[2:0]),
        .y(mux2)
    );
    
    mux2to1_nand m2 (
        .i0(mux1),
        .i1(mux2),
        .s(s[3]),
        .y(y)
    );
    
endmodule
