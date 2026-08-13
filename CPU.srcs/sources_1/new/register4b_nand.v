`timescale 1ns / 1ps
module register4b_nand(
    input wire [3:0] d,
    input wire load, clk,
    output wire [3:0] q
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
            
    
    
endmodule
