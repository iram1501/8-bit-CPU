`timescale 1ns / 1ps
module rc_adder_4b(
    input  wire [3:0] a, b,
    input  wire       c_in,
    output wire [3:0] sum,
    output wire       c_out
    );
    
    wire c1, c2, c3;
    
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
        .c_out(c_out)
    );
    
endmodule
