`timescale 1ns / 1ps
module alu8b_nand(
    input  wire [7:0] a, b, 
    input  wire [3:0] alu_op,
    output wire [7:0] y,
    output wire       z, n, v, c
    );
    
    wire [7:0] add_result,
               sub_result,
               and_result,
               or_result,
               xor_result,
               not_result, 
               shl_result,
               shr_result,
               nand_result,
               nor_result,
               xnor_result, 
               inc_result,
               dec_result,
               neg_result;
               
    wire not_a0;
    wire zero, one;
    wire add_out, sub_out, inc_out, dec_out;
    wire [7:0] one8bit;
    
    not_nand na0 (.a(a[0]), .not_a(not_a0));
    
    and_nand z0 (.a(not_a0), .b(a[0]), .y(zero));
    
    nand(one, not_a0, a[0]);
    
    one8b b0 (.a(zero), .y(one8bit));
    
    //alu_op = 0000
    rc_adder8b r0 (.a(a), .b(b), .c_in(zero), .sum(add_result), .c_out(add_out));
    //alu_op = 0001
    rc_subtractor8b r1 (.a(a), .b(b), .b_in(zero), .d(sub_result), .b_out(sub_out));
    //alu_op = 0010
    and8b r2 (.a(a), .b(b), .y(and_result));
    //alu_op = 0011
    or8b r3 (.a(a), .b(b), .y(or_result));
    //alu_op = 0100
    xor8b r4 (.a(a), .b(b), .y(xor_result));
    //alu_op = 0101
    not8b r5 (.a(a), .not_a(not_result));
    //alu_op = 0110
    left_shift8b r6 (.a(a), .y(shl_result));
    //alu_op = 0111
    right_shift8b r7 (.a(a), .y(shr_result));
    //alu_op = 1000
    nand8b r8 (.a(a), .b(b), .y(nand_result));
    //alu_op = 1001
    nor8b r9 (.a(a), .b(b), .y(nor_result));
    //alu_op = 1010
    xnor8b r10 (.a(a), .b(b), .y(xnor_result));
    //alu_op = 1011
    rc_adder8b r11 (.a(a), .b(one8bit), .c_in(zero), .sum(inc_result), .c_out(inc_out));
    //alu_op = 1100
    rc_subtractor8b r12 (.a(a), .b(one8bit), .b_in(zero), .d(dec_result), .b_out(dec_out));
    //alu_op = 1111
    neg8b r15 (.a(a), .neg_a(neg_result));
        
    
    mux16to1_8b m0 (
        .i0(add_result),
        .i1(sub_result),
        .i2(and_result),
        .i3(or_result),
        .i4(xor_result),
        .i5(not_result),
        .i6(shl_result),
        .i7(shr_result),
        .i8(nand_result),
        .i9(nor_result),
        .i10(xnor_result),
        .i11(inc_result),
        .i12(dec_result),
        .i13(a),
        .i14(b),
        .i15(neg_result),
        .s(alu_op),
        .y(y)
    );
    
    flags f0 (.a(a), .b(b), .y(y), .alu_op(alu_op), .add_out(add_out), .sub_out(sub_out), .inc_out(inc_out),
              .dec_out(dec_out), .z(z), .n(n), .c(c), .v(v));
    
    
endmodule
