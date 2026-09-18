`timescale 1ns / 1ps
module one8b(
    input a, 
    output [7:0] y
    );
    
    
    wire na;
    wire zero, one;
    
    not_nand n0 (
        .a(a),
        .not_a(na)
    );
    
    and_nand n1 (
        .a(a),
        .b(na),
        .y(zero)
    );
    
    nand(one, a, na);
    
    nand(y[0], zero, zero);
    nand(y[1], one, one);
    nand(y[2], one, one);
    nand(y[3], one, one);
    nand(y[4], one, one);
    nand(y[5], one, one);
    nand(y[6], one, one);
    nand(y[7], one, one);
    
endmodule
