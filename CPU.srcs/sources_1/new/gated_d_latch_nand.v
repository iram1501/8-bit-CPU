`timescale 1ns / 1ps
module gated_d_latch_nand(
    input wire d, e, 
    output wire q, not_q
    );
    
    wire not_d;
    wire s, r;
    
    not_nand nd (
        .a(d),
        .not_a(not_d)
    );
    
    and_nand s_gate (
        .a(d),
        .b(e),
        .y(s)
     );
     
     and_nand r_gate (
        .a(not_d),
        .b(e),
        .y(r)
     );
    
    sr_latch_nand l0 (
        .s(s),
        .r(r),
        .q(q),
        .not_q(not_q)
    );
    
    
    
endmodule
