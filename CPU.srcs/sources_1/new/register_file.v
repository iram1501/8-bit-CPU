`timescale 1ns / 1ps
module register_file(
    input        clk, write_enable,
    input  [2:0] write_addr, read_addr_a, read_addr_b,
    input  [7:0] write_data,
    output [7:0] read_data_a, read_data_b
    );
    
    // set up load
    wire sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7;
    wire load0, load1, load2, load3, load4, load5, load6, load7;
    
    decoder3x8 dec0 (.s(write_addr), .y0(sel0), .y1(sel1), .y2(sel2), .y3(sel3),
                                     .y4(sel4), .y5(sel5), .y6(sel6), .y7(sel7));
    
    and_nand l0 (.a(write_enable), .b(sel0), .y(load0));
    and_nand l1 (.a(write_enable), .b(sel1), .y(load1));
    and_nand l2 (.a(write_enable), .b(sel2), .y(load2));
    and_nand l3 (.a(write_enable), .b(sel3), .y(load3));
    and_nand l4 (.a(write_enable), .b(sel4), .y(load4));
    and_nand l5 (.a(write_enable), .b(sel5), .y(load5));
    and_nand l6 (.a(write_enable), .b(sel6), .y(load6));
    and_nand l7 (.a(write_enable), .b(sel7), .y(load7));
       
    // instantiate the 8 8bit registers
    wire [7:0] R0, R1, R2, R3, R4, R5, R6, R7;
    
    register8b reg0 (.d(write_data), .load(load0), .clk(clk), .q(R0));
    register8b reg1 (.d(write_data), .load(load1), .clk(clk), .q(R1));
    register8b reg2 (.d(write_data), .load(load2), .clk(clk), .q(R2));
    register8b reg3 (.d(write_data), .load(load3), .clk(clk), .q(R3));
    register8b reg4 (.d(write_data), .load(load4), .clk(clk), .q(R4));
    register8b reg5 (.d(write_data), .load(load5), .clk(clk), .q(R5));
    register8b reg6 (.d(write_data), .load(load6), .clk(clk), .q(R6));
    register8b reg7 (.d(write_data), .load(load7), .clk(clk), .q(R7));
    
    // instantiate 2 8x1 mux one for a and one for b
    mux8to1_8b m0 (.i0(R0), .i1(R1), .i2(R2), .i3(R3), .i4(R4), .i5(R5), .i6(R6), .i7(R7),
                   .s(read_addr_a), .y(read_data_a));
    
    mux8to1_8b m1 (.i0(R0), .i1(R1), .i2(R2), .i3(R3), .i4(R4), .i5(R5), .i6(R6), .i7(R7),
                   .s(read_addr_b), .y(read_data_b));
    
    
    
endmodule
