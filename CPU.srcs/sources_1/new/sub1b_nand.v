`timescale 1ns / 1ps
module full_subtractor1b_nand(
    input wire a, b, b_in,
    output wire d, b_out
    );
    
    wire not_b, not_bin;
    wire c_out;
    
    not_nand nb (
        .a(b),
        .not_a(not_b)
    );
    
    not_nand nbin (
        .a(b_in),
        .not_a(not_bin)
    );
    
    not_nand ncout (
        .a(c_out),
        .not_a(b_out)
    );
    
    full_adder_1b f0 (
        .a(a),
        .b(not_b),
        .c_in(not_bin),
        .sum(d),
        .c_out(c_out)
     );
    

endmodule
