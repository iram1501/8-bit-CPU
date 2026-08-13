`timescale 1ns / 1ps
module sub4b_nand(
    input wire [3:0]  a, b, 
    input wire        b_in,
    output wire [3:0] d, 
    output wire       b_out
    );
    
    wire b1, b2, b3;
    
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
        .b_out(b_out)
    );
    
endmodule
