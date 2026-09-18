`timescale 1ns / 1ps
module mux4to1_8b(
    input  [7:0] i0, i1, i2, i3,
    input  [1:0] s,
    output [8:0] y
    );
    
    mux4to1_nand m0 (.i0(i0[0]),
                     .i1(i1[0]),
                     .i2(i2[0]),
                     .i3(i3[0]),
                     .s(s),
                     .y(y[0])
    );
    
    mux4to1_nand m1 (.i0(i0[1]),
                     .i1(i1[1]),
                     .i2(i2[1]),
                     .i3(i3[1]),
                     .s(s),
                     .y(y[1])
    );
    
    mux4to1_nand m2 (.i0(i0[2]),
                     .i1(i1[2]),
                     .i2(i2[2]),
                     .i3(i3[2]),
                     .s(s),
                     .y(y[2])
    );
    
    mux4to1_nand m3 (.i0(i0[3]),
                     .i1(i1[3]),
                     .i2(i2[3]),
                     .i3(i3[3]),
                     .s(s),
                     .y(y[3])
    );
    
    mux4to1_nand m4 (.i0(i0[4]),
                     .i1(i1[4]),
                     .i2(i2[4]),
                     .i3(i3[4]),
                     .s(s),
                     .y(y[4])
    );
    
    mux4to1_nand m5 (.i0(i0[5]),
                     .i1(i1[5]),
                     .i2(i2[5]),
                     .i3(i3[5]),
                     .s(s),
                     .y(y[5])
    );
    
    mux4to1_nand m6 (.i0(i0[6]),
                     .i1(i1[6]),
                     .i2(i2[6]),
                     .i3(i3[6]),
                     .s(s),
                     .y(y[6])
    );
    
    mux4to1_nand m7 (.i0(i0[7]),
                     .i1(i1[7]),
                     .i2(i2[7]),
                     .i3(i3[7]),
                     .s(s),
                     .y(y[7])
    );
        
    
endmodule
