`timescale 1ns / 1ps
module full_adder_1b(
    input wire a, b, c_in,
    output wire sum, c_out
    );
    
    wire xor_ab;
    wire and_ab, and_cin_xab;
    
    xor_nand xab ( // a^b
        .a(a),
        .b(b),
        .y(xor_ab)
    );
    
    xor_nand xabc_in ( // (a^b) ^ c_in = sum
        .a(xor_ab),
        .b(c_in),
        .y(sum)
    );
    
    and_nand ab ( // a&b
        .a(a),
        .b(b),
        .y(and_ab)
    );
    
    and_nand cin_xab ( // c_in & (a^b)
        .a(c_in),
        .b(xor_ab),
        .y(and_cin_xab)
    );
    
    or_nand n0 ( // a&b + c_in & (a^b) = c_out
        .a(and_ab),
        .b(and_cin_xab),
        .y(c_out)
    );
    
endmodule
