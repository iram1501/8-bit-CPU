`timescale 1ns / 1ps
module neg8b(
    input [7:0] a, 
    output [7:0] neg_a
    );
    
    wire [7:0] not_a, one8bit;
    wire not_a0, zero, inc_out;
    
    not8b n0 (.a(a), .not_a(not_a)); // a -> ~a
    
    not_nand na0 (.a(a[0]), .not_a(not_a0));
    and_nand z0 (.a(not_a0), .b(a[0]), .y(zero));
    
    one8b b0 (.a(zero), .y(one8bit)); // 8'b00000001
    
    rc_adder8b fa0 (  // ~a + 8'b00000001 = -a
        .a(not_a),
        .b(one8bit),
        .c_in(zero),
        .sum(neg_a),
        .c_out(inc_out)
    );
    
    
endmodule
