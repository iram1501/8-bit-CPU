`timescale 1ns / 1ps
module mux8to1_4b_nand(
    input wire [3:0] i0,
                     i1,
                     i2,
                     i3,
                     i4,
                     i5,
                     i6,
                     i7,
    input wire [2:0] s, 
    output wire [3:0] y
    );
    
    mux8to1_nand m0(
        .i0(i0[0]),
        .i1(i1[0]),
        .i2(i2[0]),
        .i3(i3[0]),
        .i4(i4[0]),
        .i5(i5[0]),
        .i6(i6[0]),
        .i7(i7[0]),
        .s(s),
        .y(y[0])
    );
    
    mux8to1_nand m1(
        .i0(i0[1]),
        .i1(i1[1]),
        .i2(i2[1]),
        .i3(i3[1]),
        .i4(i4[1]),
        .i5(i5[1]),
        .i6(i6[1]),
        .i7(i7[1]),
        .s(s),
        .y(y[1])
    );
    
    mux8to1_nand m2(
        .i0(i0[2]),
        .i1(i1[2]),
        .i2(i2[2]),
        .i3(i3[2]),
        .i4(i4[2]),
        .i5(i5[2]),
        .i6(i6[2]),
        .i7(i7[2]),
        .s(s),
        .y(y[2])
    );
    
    mux8to1_nand m3(
        .i0(i0[3]),
        .i1(i1[3]),
        .i2(i2[3]),
        .i3(i3[3]),
        .i4(i4[3]),
        .i5(i5[3]),
        .i6(i6[3]),
        .i7(i7[3]),
        .s(s),
        .y(y[3])
    );
        
    
    
endmodule
