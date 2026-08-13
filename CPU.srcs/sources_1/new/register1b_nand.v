`timescale 1ns / 1ps
module register1b_nand(
    input wire d, load, clk,
    output wire q
    );
    
    wire d_next;
    wire not_q;
    
    mux2to1_nand m0 (
        .i0(q),
        .i1(d),
        .s(load),
        .y(d_next)
    );
    
    d_flipflop_nand ff0 (
        .d(d_next),
        .clk(clk),
        .q(q),
        .not_q(not_q)
    );
        
    
endmodule
