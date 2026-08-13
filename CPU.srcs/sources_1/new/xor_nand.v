`timescale 1ns / 1ps
module xor_nand(
    input wire a, b, 
    output wire y
    );
    
    wire not_a, not_b;
    wire nand_a1b, nand_ab1;
    
    not_nand na (
        .a(a),
        .not_a(not_a)
    );
    
    not_nand nb (
        .a(b),
        .not_a(not_b)
    );
    
    nand(nand_a1b, not_a, b);
    nand(nand_ab1, a, not_b);
    nand(y, nand_a1b, nand_ab1);
    
endmodule
