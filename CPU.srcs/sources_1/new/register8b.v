`timescale 1ns / 1ps
module register8b(
    input  [7:0] d, 
    input        load, clk,
    output [7:0] q
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
    
    
    
endmodule
