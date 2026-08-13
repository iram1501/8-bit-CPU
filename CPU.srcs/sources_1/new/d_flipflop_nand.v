`timescale 1ns / 1ps
module d_flipflop_nand(
    input wire d, clk, 
    output wire q, not_q
    );
    
    wire not_clk;
    wire master_q, master_not_q;
    
    not_nand nc (
        .a(clk),
        .not_a(not_clk)
    );
    
    gated_d_latch_nand master (
        .d(d),
        .e(not_clk),
        .q(master_q),
        .not_q(master_not_q)
    );
    
    gated_d_latch_nand slave (
        .d(master_q),
        .e(clk),
        .q(q),
        .not_q(not_q)
    );
    
endmodule
