`timescale 1ns / 1ps
module alu4b_nand(
    input  wire [3:0] a, b, 
    input  wire [2:0] alu_op,
    output wire [3:0] y
    );
    
    wire [3:0] add_result,
               sub_result,
               and_result,
               or_result,
               xor_result,
               not_result, 
               shl_result,
               shr_result;
               
    wire not_a0;
    wire zero;
    wire add_cout, sub_cout;
    
    not_nand na0 (
        .a(a[0]),
        .not_a(not_a0)
    );
    
    and_nand z0 (
         .a(not_a0),
         .b(a[0]),
         .y(zero)
    );
    
    rc_adder_4b r0 (
        .a(a), 
        .b(b),
        .c_in(zero),
        .sum(add_result),
        .c_out(add_cout)
    );
    
    sub4b_nand r1 (
        .a(a),
        .b(b),
        .b_in(zero),
        .d(sub_result),
        .b_out(sub_cout)
    );
    
    and4b_nand r2 (
        .a(a),
        .b(b),
        .y(and_result)
    );
               
    or4b_nand r3 (
        .a(a),
        .b(b),
        .y(or_result)
    );
    
    xor4b_nand r4 (
        .a(a),
        .b(b), 
        .y(xor_result)
    );
    
    not4b_nand r5 (
        .a(a),
        .not_a(not_result)
    );
    
    left_shift4b_nand r6 (
        .a(a), 
        .y(shl_result)
    );
    
    right_shift4b_nand r7 (
        .a(a),
        .y(shr_result)
    );
    
    mux8to1_4b_nand m0 (
        .i0(add_result),
        .i1(sub_result),
        .i2(and_result),
        .i3(or_result),
        .i4(xor_result),
        .i5(not_result),
        .i6(shl_result),
        .i7(shr_result),
        .s(alu_op),
        .y(y)
    );
    
    
endmodule
