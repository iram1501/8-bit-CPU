`timescale 1ns / 1ps

module nor_nand(
    input wire a, b, 
    output wire y
    );
    
    wire or_ab;
    
    or_nand n1 (
        .a (a),
        .b (b),
        .y (or_ab)
    );
    
    not_nand n2 (
        .a (or_ab),
        .not_a (y)
    );
    
endmodule
