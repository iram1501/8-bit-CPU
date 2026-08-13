`timescale 1ns / 1ps

module or_nand(
    input wire a, b, 
    output wire y
    );
    
    wire not_a, not_b;
    
    not_nand na (
        .a (a),
        .not_a (not_a)
    );
    
    not_nand nb (
        .a (b),
        .not_a (not_b)
    );
    
    nand (y, not_a, not_b);
    
endmodule
