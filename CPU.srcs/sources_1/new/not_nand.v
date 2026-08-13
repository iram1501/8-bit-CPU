`timescale 1ns / 1ps
module not_nand(
    input wire a, 
    output wire not_a
    );
    
    nand (not_a, a, a);
    
endmodule
