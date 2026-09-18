`timescale 1ns / 1ps
module rc_subtractor8b(
    input  [7:0] a, b,
    input        b_in,
    output [7:0] d,
    output       b_out
    );
    
    wire b1, b2, b3, b4, b5, b6, b7;
    
    full_subtractor1b_nand s0 (
        .a(a[0]),
        .b(b[0]),
        .b_in(b_in),
        .d(d[0]),
        .b_out(b1)
    );
    
    full_subtractor1b_nand s1 (
        .a(a[1]),
        .b(b[1]),
        .b_in(b1),
        .d(d[1]),
        .b_out(b2)
    );
    
    full_subtractor1b_nand s2 (
        .a(a[2]),
        .b(b[2]),
        .b_in(b2),
        .d(d[2]),
        .b_out(b3)
    );
    
    full_subtractor1b_nand s3 (
        .a(a[3]),
        .b(b[3]),
        .b_in(b3),
        .d(d[3]),
        .b_out(b4)
    );
    
    full_subtractor1b_nand s4 (
        .a(a[4]),
        .b(b[4]),
        .b_in(b4),
        .d(d[4]),
        .b_out(b5)
    );
    
    full_subtractor1b_nand s5 (
        .a(a[5]),
        .b(b[5]),
        .b_in(b5),
        .d(d[5]),
        .b_out(b6)
    );
    
    full_subtractor1b_nand s6 (
        .a(a[6]),
        .b(b[6]),
        .b_in(b6),
        .d(d[6]),
        .b_out(b7)
    );
    
    full_subtractor1b_nand s7 (
        .a(a[7]),
        .b(b[7]),
        .b_in(b7),
        .d(d[7]),
        .b_out(b_out)
    );
    
endmodule
