`timescale 1ns / 1ps

module flags(
    input [7:0] a, b, y,
    input [3:0] alu_op,
    input add_out, sub_out, inc_out, dec_out,
    output z, n, c, v
    );
    
    // n = y[7]
    wire ny7;

    not_nand n0 (.a(y[7]), .not_a(ny7));
    nand(n, ny7, ny7);
    
    // z = ~(y[7] | y[6] | ... | y[1] | y[0])
    wire oy01, oy23, oy45, oy67;
    wire oy03, oy47;
    wire nz;   
    
    or_nand o0 (.a(y[0]), .b(y[1]), .y(oy01));
    or_nand o1 (.a(y[2]), .b(y[3]), .y(oy23));
    or_nand o2 (.a(y[4]), .b(y[5]), .y(oy45));
    or_nand o3 (.a(y[6]), .b(y[7]), .y(oy67));
    or_nand o4 (.a(oy01), .b(oy23), .y(oy03));
    or_nand o5 (.a(oy45), .b(oy67), .y(oy47));
    or_nand o6 (.a(oy03), .b(oy47), .y(nz));
    not_nand n1 (.a(nz),.not_a(z));
    
    // c = (add_out & add_sel) | (sub_out & sub_sel) | (inc_out & inc_sel) | (dec_out & dec_sel)
    wire add_sel, sub_sel, inc_sel, dec_sel;
    wire add, sub, inc, dec;
    wire c0, c1;
    
    op_sel sel0 (.alu_op(alu_op), .add_sel(add_sel), .sub_sel(sub_sel), .inc_sel(inc_sel), .dec_sel(dec_sel));
    
    and_nand c_a0 (.a(add_out), .b(add_sel), .y(add));
    and_nand c_a1 (.a(sub_out), .b(sub_sel), .y(sub));
    and_nand c_a2 (.a(inc_out), .b(inc_sel), .y(inc));
    and_nand c_a3 (.a(dec_out), .b(dec_sel), .y(dec));
    
    or_nand c_o0 (.a(add), .b(sub), .y(c0));
    or_nand c_o1 (.a(inc), .b(dec), .y(c1));
    
    or_nand c_o2 (.a(c0), .b(c1), .y(c));
    
    // v = (v_add & add_sel) | (v_sub & sub_sel) | (v_inc & inc_sel) | (v_dec & dec_sel)
    wire v_add, v_sub, v_inc, v_dec;
    wire vadd, vsub, vinc, vdec;
    wire v0, v1;
    
    v_op vop0 (.a(a), .b(b), .y(y), .v_add(v_add), .v_sub(v_sub), .v_inc(v_inc), .v_dec(v_dec));
    
    and_nand v_a0 (.a(v_add), .b(add_sel), .y(vadd));
    and_nand v_a1 (.a(v_sub), .b(sub_sel), .y(vsub));
    and_nand v_a2 (.a(v_inc), .b(inc_sel), .y(vinc));
    and_nand v_a3 (.a(v_dec), .b(dec_sel), .y(vdec));
    
    or_nand v_o0 (.a(vadd), .b(vsub), .y(v0));
    or_nand v_o1 (.a(vinc), .b(vdec), .y(v1));
    
    or_nand v_o2 (.a(v0), .b(v1), .y(v));
        
endmodule
