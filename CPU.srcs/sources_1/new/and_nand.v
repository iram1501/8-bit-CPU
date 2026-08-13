`timescale 1ns / 1ps

module and_nand(
    input wire a, b, 
    output wire y
    );
    
    wire nand_ab;
    
    nand (nand_ab, a, b);
    
    not_nand n1 (
        .a (nand_ab),
        .not_a (y)
    );
    
endmodule
