`timescale 1ns / 1ps
module register16b(
    input  [15:0] d,
    input         load, clk,
    output [15:0] q
    );
    
    register1b_nand r0 (
        .d(d[0]),
        .load(load),
        .clk(clk),
        .q(q[0])
    );
    
    register1b_nand r1 (
        .d(d[1]),
        .load(load),
        .clk(clk),
        .q(q[1])
    );
    
    register1b_nand r2 (
        .d(d[2]),
        .load(load),
        .clk(clk),
        .q(q[2])
    );
    
    register1b_nand r3 (
        .d(d[3]),
        .load(load),
        .clk(clk),
        .q(q[3])
    );
    
    register1b_nand r4 (
        .d(d[4]),
        .load(load),
        .clk(clk),
        .q(q[4])
    );
    
    register1b_nand r5 (
        .d(d[5]),
        .load(load),
        .clk(clk),
        .q(q[5])
    );
    
    register1b_nand r6 (
        .d(d[6]),
        .load(load),
        .clk(clk),
        .q(q[6])
    );
    
    register1b_nand r7 (
        .d(d[7]),
        .load(load),
        .clk(clk),
        .q(q[7])
    );
    
    register1b_nand r8 (
        .d(d[8]),
        .load(load),
        .clk(clk),
        .q(q[8])
    );
    
    register1b_nand r9 (
        .d(d[9]),
        .load(load),
        .clk(clk),
        .q(q[9])
    );
    
    register1b_nand r10 (
        .d(d[10]),
        .load(load),
        .clk(clk),
        .q(q[10])
    );
    
    register1b_nand r11 (
        .d(d[11]),
        .load(load),
        .clk(clk),
        .q(q[11])
    );
    
    register1b_nand r12 (
        .d(d[12]),
        .load(load),
        .clk(clk),
        .q(q[12])
    );
    
    register1b_nand r13 (
        .d(d[13]),
        .load(load),
        .clk(clk),
        .q(q[13])
    );
    
    register1b_nand r14 (
        .d(d[14]),
        .load(load),
        .clk(clk),
        .q(q[14])
    );
    
    register1b_nand r15 (
        .d(d[15]),
        .load(load),
        .clk(clk),
        .q(q[15])
    );
    
endmodule
