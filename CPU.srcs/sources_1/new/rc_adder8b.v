`timescale 1ns / 1ps
module rc_adder8b(
    input  [7:0] a, b, 
    input        c_in,
    output [7:0] sum,
    output       c_out
    );
    
    wire c1, c2, c3, c4, c5, c6, c7;
    
    full_adder_1b f0 (
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(c1)
    );
    
    full_adder_1b f1 (
        .a(a[1]),
        .b(b[1]),
        .c_in(c1),
        .sum(sum[1]),
        .c_out(c2)
    );
    
    full_adder_1b f2 (
        .a(a[2]),
        .b(b[2]),
        .c_in(c2),
        .sum(sum[2]),
        .c_out(c3)
    );
    
    full_adder_1b f3 (
        .a(a[3]),
        .b(b[3]),
        .c_in(c3),
        .sum(sum[3]),
        .c_out(c4)
    );
    
    full_adder_1b f4 (
        .a(a[4]),
        .b(b[4]),
        .c_in(c4),
        .sum(sum[4]),
        .c_out(c5)
    );
    
    full_adder_1b f5 (
        .a(a[5]),
        .b(b[5]),
        .c_in(c5),
        .sum(sum[5]),
        .c_out(c6)
    );
    
    full_adder_1b f6 (
        .a(a[6]),
        .b(b[6]),
        .c_in(c6),
        .sum(sum[6]),
        .c_out(c7)
    );
    
    full_adder_1b f7 (
        .a(a[7]),
        .b(b[7]),
        .c_in(c7),
        .sum(sum[7]),
        .c_out(c_out)
    );
    
    
endmodule
