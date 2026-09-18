`timescale 1ns / 1ps
module v_op(
    input [7:0] a, b, y,
    output v_add, v_sub, v_inc, v_dec
    );
    
    // v_add = ~(a[7] ^ b[7]) & (a[7] ^ y[7])
    wire a0, a1, na0;
    
    xor_nand add_x0 (.a(a[7]), .b(b[7]), .y(a0));
    not_nand add_n0 (.a(a0), .not_a(na0));
    xor_nand add_x1 (.a(a[7]), .b(y[7]), .y(a1));
    
    and_nand add_a0 (.a(na0), .b(a1), .y(v_add));
    
    // v_sub = (a[7] ^ b[7]) & (a[7] ^ y[7])     
    
    and_nand sub_a0 (.a(a0), .b(a1), .y(v_sub));
    
    // v_inc = ~a[7] & y[7]
    
    wire na7;
    
    not_nand inc_n0 (.a(a[7]), .not_a(na7));
    and_nand inc_a0 (.a(na7), .b(y[7]), .y(v_inc));
    
    // v_dec = a[7] & ~y[7]
    
    wire ny7;
    
    not_nand dec_n0 (.a(y[7]), .not_a(ny7));
    and_nand dec_a0 (.a(a[7]), .b(ny7), .y(v_dec));
    
endmodule
