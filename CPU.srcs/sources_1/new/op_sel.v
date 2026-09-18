module op_sel(
    input [3:0] alu_op,
    output add_sel, sub_sel, inc_sel, dec_sel
    );
    
    // add_sel = 0000
    // sub_sel = 0001
    // inc_sel = 1011
    // dec_sel = 1100
    
    wire na0, na1, na2, na3;
    
    not_nand n0 (.a(alu_op[0]), .not_a(na0));
    not_nand n1 (.a(alu_op[1]), .not_a(na1));
    not_nand n2 (.a(alu_op[2]), .not_a(na2));
    not_nand n3 (.a(alu_op[3]), .not_a(na3));
    
    //add_sel block
    wire a0, a1;
    
    and_nand add_a0 (.a(na0), .b(na1), .y(a0));
    and_nand add_a1 (.a(na2), .b(na3), .y(a1));
    
    and_nand add_a2 (.a(a0), .b(a1), .y(add_sel));
    
    //sub_sel block
    wire s0, s1; 
    
    and_nand sub_a0 (.a(alu_op[0]), .b(na1), .y(s0));
    and_nand sub_a1 (.a(na2), .b(na3), .y(s1));
    
    and_nand sub_a2 (.a(s0), .b(s1), .y(sub_sel));
    
    //inc_sel block
    wire i0, i1;
    
    and_nand inc_a0 (.a(alu_op[3]), .b(na2), .y(i0));
    and_nand inc_a1 (.a(alu_op[1]), .b(alu_op[0]), .y(i1));
    
    and_nand inc_a2 (.a(i0), .b(i1), .y(inc_sel));
    
    //dec_sel block
    wire d0, d1;
    
    and_nand dec_a0 (.a(alu_op[3]), .b(alu_op[2]), .y(d0));
    and_nand dec_a1 (.a(na1), .b(na0), .y(d1));
    
    and_nand dec_a2 (.a(d0), .b(d1), .y(dec_sel));
    
endmodule
