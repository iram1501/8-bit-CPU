`timescale 1ns / 1ps
module decoder4x16(
    input [3:0] s,
    output y0, y1, y2, y3, y4, y5, y6, y7,
           y8, y9, y10, y11, y12, y13, y14, y15
    );
    
    wire d0_0, d0_1, d0_2, d0_3, d0_4, d0_5, d0_6, d0_7;
    wire d1_0, d1_1, d1_2, d1_3, d1_4, d1_5, d1_6, d1_7;
    wire ns3;  
    
    not_nand n0 (.a(s[3]), .not_a(ns3)); 
    
    decoder3x8 d0 (
        .s(s[2:0]),
        .y0(d0_0),
        .y1(d0_1),
        .y2(d0_2),
        .y3(d0_3),
        .y4(d0_4),
        .y5(d0_5),
        .y6(d0_6),
        .y7(d0_7)
    );
    
    decoder3x8 d1 (
        .s(s[2:0]),
        .y0(d1_0),
        .y1(d1_1),
        .y2(d1_2),
        .y3(d1_3),
        .y4(d1_4),
        .y5(d1_5),
        .y6(d1_6),
        .y7(d1_7)
    );
    
    and_nand g0 (.a(d0_0), .b(ns3), .y(y0));
    and_nand g1 (.a(d0_1), .b(ns3), .y(y1));
    and_nand g2 (.a(d0_2), .b(ns3), .y(y2));
    and_nand g3 (.a(d0_3), .b(ns3), .y(y3));
    and_nand g4 (.a(d0_4), .b(ns3), .y(y4));
    and_nand g5 (.a(d0_5), .b(ns3), .y(y5));
    and_nand g6 (.a(d0_6), .b(ns3), .y(y6));               
    and_nand g7 (.a(d0_7), .b(ns3), .y(y7));
    
    and_nand g8 (.a(d1_0), .b(s[3]), .y(y8));
    and_nand g9 (.a(d1_1), .b(s[3]), .y(y9));
    and_nand g10 (.a(d1_2), .b(s[3]), .y(y10));
    and_nand g11 (.a(d1_3), .b(s[3]), .y(y11));
    and_nand g12 (.a(d1_4), .b(s[3]), .y(y12));
    and_nand g13 (.a(d1_5), .b(s[3]), .y(y13));
    and_nand g14 (.a(d1_6), .b(s[3]), .y(y14));
    and_nand g15 (.a(d1_7), .b(s[3]), .y(y15));
    
    
endmodule
