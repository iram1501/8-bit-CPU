`timescale 1ns / 1ps
module control_unit(
    input  [3:0] opcode,
    input        z_flag, c_flag,
    output       reg_write, mem_write, pc_load, 
                 pc_inc, halt,
    output [3:0] alu_op,
    output [1:0] writeback_sel
    );
    
    wire op_nop,
         op_add,
         op_sub,
         op_and,
         op_or,
         op_xor,
         op_not,
         op_shl,
         op_shr,
         op_ldi,
         op_ld, 
         op_str,
         op_jmp,
         op_jz,
         op_jc,
         op_halt;
         
    wire one, zero;
    wire no0;
    not_nand n0 (.a(opcode[0]), .not_a(no0));
    or_nand o0 (.a(no0), .b(opcode[0]), .y(one));
    nand(zero, one, one);
     
    // assigns each opcode for each instruction in the ISA     
    decoder4x16 d0 (.s(opcode),  .y0(op_nop), .y1(op_add),  .y2(op_sub), .y3(op_and),
                    .y4(op_or),  .y5(op_xor), .y6(op_not),  .y7(op_shl), .y8(op_shr),
                    .y9(op_ldi), .y10(op_ld), .y11(op_str), .y12(op_jmp), 
                    .y13(op_jz), .y14(op_jc), .y15(op_halt));
    //halt HALT             
    and_nand a_halt (.a(one), .b(op_halt), .y(halt));
    //mem_write STR
    and_nand a_mem (.a(one), .b(op_str), .y(mem_write));
    //reg_write AND | SUB | AND | OR | XOR | NOT | SHL | SHR | LDI | LD
    wire i0, i1, i2, i3, i4, i5, i6, i7;
    or_nand reg0 (.a(op_add), .b(op_sub), .y(i0));
    or_nand reg1 (.a(i0), .b(op_and), .y(i1));
    or_nand reg2 (.a(i1), .b(op_or), .y(i2));
    or_nand reg3 (.a(i2), .b(op_xor), .y(i3));
    or_nand reg4 (.a(i3), .b(op_not), .y(i4));
    or_nand reg5 (.a(i4), .b(op_shl), .y(i5));
    or_nand reg6 (.a(i5), .b(op_shr), .y(i6));
    or_nand reg7 (.a(i6), .b(op_ldi), .y(i7));
    or_nand reg8 (.a(i7), .b(op_ld), .y(reg_write));
    //pc_load (JZ & z_flag) | (JC & c_flag) | JMP
    wire z, c, zc;
    and_nand load0 (.a(z_flag), .b(op_jz), .y(z));
    and_nand load1 (.a(c_flag), .b(op_jc), .y(c));
    or_nand load2 (.a(z), .b(c), .y(zc));
    or_nand load3 (.a(zc), .b(op_jmp), .y(pc_load));
    //pc_inc ~(halt | pc_load)
    wire halt_pcload;
    or_nand inc0 (.a(halt), .b(pc_load), .y(halt_pcload));
    not_nand inc1 (.a(halt_pcload), .not_a(pc_inc));
    
    
    // assigning the alu_op to the separate opcodes
    // alu_op[3] will be 0
    nand(alu_op[3], one, one);
    // alu_op[2] is XOR | NOT | SHR | SHL
    wire alu20, alu21;
    or_nand alu0 (.a(op_xor), .b(op_not), .y(alu20));
    or_nand alu1 (.a(op_shr), .b(op_shl), .y(alu21));
    or_nand alu2 (.a(alu20), .b(alu21), .y(alu_op[2]));
    // alu_op[1] is AND | OR | SHL | SHR
    wire alu10;
    or_nand alu3 (.a(op_and), .b(op_or), .y(alu10));
    or_nand alu4 (.a(alu10), .b(alu21), .y(alu_op[1]));
    // alu_op[0] is SUB | OR | NOT | SHR
    wire alu00, alu01;
    or_nand alu5 (.a(op_sub), .b(op_or), .y(alu00));
    or_nand alu6 (.a(op_not), .b(op_shr), .y(alu01));
    or_nand alu7 (.a(alu00), .b(alu01), .y(alu_op[0]));
    
    // assigning writeback_sel[1] to ld and writeback_sel[0] to ldi
    and_nand wb0 (.a(one), .b(op_ldi), .y(writeback_sel[0]));
    and_nand wb1 (.a(one), .b(op_ld), .y(writeback_sel[1]));
                     
    
       
    
    
endmodule
