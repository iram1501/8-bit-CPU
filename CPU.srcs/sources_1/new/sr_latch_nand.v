`timescale 1ns / 1ps
module sr_latch_nand(
    input wire s, r, 
    output wire q, not_q
    );

    wire not_s, not_r;
    
    not_nand ns (
        .a(s),
        .not_a(not_s)
    );
    
    not_nand nr (
        .a(r),
        .not_a(not_r)
    );
    
    not_nand no (
        .a(out),
        .not_a(not_out)
    );
    
    nand(q, not_s, not_q);
    nand(not_q, not_r, q);
    
endmodule
