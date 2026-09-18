`timescale 1ns / 1ps
module decoder3x8(
    input [2:0] s, 
    output y0, y1, y2, y3, y4, y5, y6, y7
    );
    
    wire ns0, ns1, ns2;
    wire zz, oz, zo, oo;
    
    not_nand n0 (.a(s[0]), .not_a(ns0));
    not_nand n1 (.a(s[1]), .not_a(ns1));
    not_nand n2 (.a(s[2]), .not_a(ns2));
    
    // 00
    and_nand sel_a0 (.a(ns1), .b(ns0), .y(zz));
    
    // 01
    and_nand sel_a1 (.a(ns1), .b(s[0]), .y(zo));
    
    // 10
    and_nand sel_a2 (.a(s[1]), .b(ns0), .y(oz));
    
    // 11
    and_nand sel_a3 (.a(s[1]), .b(s[0]), .y(oo));
    
    and_nand y_0 (.a(ns2), .b(zz), .y(y0));
    and_nand y_1 (.a(ns2), .b(zo), .y(y1));
    and_nand y_2 (.a(ns2), .b(oz), .y(y2));
    and_nand y_3 (.a(ns2), .b(oo), .y(y3));
    and_nand y_4 (.a(s[2]), .b(zz), .y(y4));
    and_nand y_5 (.a(s[2]), .b(zo), .y(y5));
    and_nand y_6 (.a(s[2]), .b(oz), .y(y6));
    and_nand y_7 (.a(s[2]), .b(oo), .y(y7));
    
endmodule
