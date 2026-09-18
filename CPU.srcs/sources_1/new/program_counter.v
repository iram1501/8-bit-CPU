`timescale 1ns / 1ps
module program_counter(
    input        clk, load, inc, reset,
    input  [7:0] data_in,
    output [7:0] pc
    );
    
    // set-up 8'b00000001
    wire not_d7;
    wire zero, one;
    wire [7:0] one8bit, zero8bit;
    
    not_nand na0 (.a(data_in[0]), .not_a(not_d7));
    and_nand z0 (.a(not_d7), .b(data_in[0]), .y(zero));
    one8b b0 (.a(zero), .y(one8bit));
    
    nand(one, zero, zero);
    
    //set-up 8'b00000000
    zero8b b1 (.a(one), .y(zero8bit));
    
    // set-up pc + 1
    wire inc_out;
    wire [7:0] pc1, pc_result, pc_reg, pc_next;
    
    rc_adder8b f0 (.a(pc), .b(one8bit), .c_in(zero), .sum(pc1), .c_out(inc_out));
    
    // 2x1 mux that chooses either pc or pc+1
    mux2to1_8b m0 (.i0(pc), .i1(pc1), .s(inc), .y(pc_result));
    
    // 2x1 mux that chooses either chooses the pc or loads data
    mux2to1_8b m1 (.i0(pc_result), .i1(data_in), .s(load), .y(pc_reg));
    
    //2x1 muc that chooses from the result of m1 and reset
    mux2to1_8b m2 (.i0(pc_reg), .i1(zero8bit), .s(reset), .y(pc_next));
    
    // 8-bit register for the pc
    register8b r0 (.d(pc_next), .load(one), .clk(clk), .q(pc));
    
endmodule
