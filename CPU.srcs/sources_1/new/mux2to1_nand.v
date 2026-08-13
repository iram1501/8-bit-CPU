`timescale 1ns / 1ps
module mux2to1_nand(
    input wire i0, i1, s,
    output wire y
    );
    
    wire not_s;
    wire na_nsi0, na_si1;
    
    not_nand ns (
        .a(s),
        .not_a(not_s)
    );
    
    nand(na_nsi0, not_s, i0);
    nand(na_si1, s, i1);
    nand(y, na_nsi0, na_si1);
    
endmodule
