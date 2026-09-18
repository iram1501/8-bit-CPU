`timescale 1ns / 1ps
module cpu(
    input clk, reset,
    input prog_write,
    input [7:0] prog_addr,
    input [15:0] prog_data,
    output halt
    );
    
    wire one;
    wire npa7;
    not_nand one0 (.a(prog_addr[7]), .not_a(npa7));
    or_nand one1 (.a(prog_addr[7]), .b(npa7), .y(one));
    
    wire [7:0] zero8;
    zero8b z0 (.a(one), .y(zero8));
    
    
    wire [7:0] pc, jmp_addr;
    wire [15:0] instr;
    wire [7:0] instr_addr;
    wire pc_inc, pc_load;
    
    wire [3:0] opcode;
    wire [2:0] rd_addr, ra_addr, rb_addr;
    wire [7:0] immd;
    wire [7:0] load_data;
    
    wire [7:0] ra_data, rb_data;
    
    wire [7:0] alu_res;
    wire [3:0] alu_op;
    
    wire reg_write, mem_write;
    wire [1:0] writeback_sel;
    
    wire z_flag, c_flag, n_flag, v_flag;
    
    wire [7:0] writeback_data;
    
    wire [15:0] data_ram_out;
    wire [15:0] data_ram_in;
    // PC
    program_counter pc0 (.clk(clk), .reset(reset), .load(pc_load), .inc(pc_inc),
                         .data_in(jmp_addr), .pc(pc));
    // instruction memeory
    ram256x16 instr_mem (.clk(clk), .write_enable(prog_write), .addr(instr_addr),
                         .data_in(prog_data), .data_out(instr));
    // data memory                     
    ram256x16 data_mem (.clk(clk), .write_enable(mem_write), .addr(ra_data), 
                        .data_in(data_ram_in), .data_out(data_ram_out));
                        
    // break apart the instruction
    // opcode
    and_nand op3 (.a(one), .b(instr[15]), .y(opcode[3]));
    and_nand op2 (.a(one), .b(instr[14]), .y(opcode[2]));
    and_nand op1 (.a(one), .b(instr[13]), .y(opcode[1]));                   
    and_nand op0 (.a(one), .b(instr[12]), .y(opcode[0]));
    // rd_addr
    and_nand rd2 (.a(one), .b(instr[11]), .y(rd_addr[2])); 
    and_nand rd1 (.a(one), .b(instr[10]), .y(rd_addr[1])); 
    and_nand rd0 (.a(one), .b(instr[9]),  .y(rd_addr[0]));                    
    // ra_addr
    and_nand ra2 (.a(one), .b(instr[8]),  .y(ra_addr[2]));
    and_nand ra1 (.a(one), .b(instr[7]),  .y(ra_addr[1]));
    and_nand ra0 (.a(one), .b(instr[6]),  .y(ra_addr[0]));
    // rb_addr
    and_nand rb2 (.a(one), .b(instr[5]),  .y(rb_addr[2]));
    and_nand rb1 (.a(one), .b(instr[4]),  .y(rb_addr[1]));
    and_nand rb0 (.a(one), .b(instr[3]),  .y(rb_addr[0]));
    // jmp_addr
    assign8b jmp0 (.a(instr[7:0]), .y(jmp_addr));
    // immd
    assign8b immd0 (.a(instr[8:1]), .y(immd));
    //load_data
    assign8b load0 (.a(data_ram_out[7:0]), .y(load_data));
    
    // control unit
    control_unit cu0 (.opcode(opcode), .z_flag(z_flag), .c_flag(c_flag), 
                      .reg_write(reg_write), .mem_write(mem_write),
                      .pc_load(pc_load), .pc_inc(pc_inc), .halt(halt),
                      .alu_op(alu_op), .writeback_sel(writeback_sel));
    // register file 
    register_file rf0 (.clk(clk), .write_enable(reg_write), .write_addr(rd_addr),
                       .read_addr_a(ra_addr), .read_addr_b(rb_addr), 
                       .write_data(writeback_data), .read_data_a(ra_data),
                       .read_data_b(rb_data));
    // alu
    alu8b_nand alu0 (.a(ra_data), .b(rb_data), .alu_op(alu_op), .y(alu_res), 
                     .z(z_flag), .c(c_flag), .n(n_flag), .v(v_flag));  
    // sign-extend rb_data to fit into data_ram_in
    sign_extend8bto16b (.a(rb_data), .y(data_ram_in));       
    
    mux4to1_8b m0 (.i0(alu_res), .i1(immd), .i2(load_data), .i3(zero8), 
                   .s(writeback_sel), .y(writeback_data));          
                    
    
    
    
    
    
endmodule
