`timescale 1ns / 1ps
module instruction_register(
    input  [15:0] instr_in,
    input         clk, load,
    output [15:0] instr
    );
    
    register16b ir0 (.d(instr_in), .clk(clk), .load(load), .q(instr));
    
endmodule
