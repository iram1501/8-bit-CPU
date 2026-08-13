`timescale 1ns / 1ps
module xnor_nand(
    input wire a, b,
    output wire y
    );
    
    wire xor_ab;
    
    xor_nand n0 (
        .a(a),
        .b(b),
        .y(xor_ab)
    );
    
    not_nand n1 (
        .a(xor_ab),
        .not_a(y)
    );
    
endmodule
