`timescale 1ns / 1ps

module or256_nand(
    input  wire [255:0] a,
    output wire         y
);

    wire [127:0] level1;
    wire [63:0]  level2;
    wire [31:0]  level3;
    wire [15:0]  level4;
    wire [7:0]   level5;
    wire [3:0]   level6;
    wire [1:0]   level7;
    
    
    // 256 -> 128
    
    or8b l1_0  (.a(a[7:0]),     .b(a[135:128]), .y(level1[7:0]));
    or8b l1_1  (.a(a[15:8]),    .b(a[143:136]), .y(level1[15:8]));
    or8b l1_2  (.a(a[23:16]),   .b(a[151:144]), .y(level1[23:16]));
    or8b l1_3  (.a(a[31:24]),   .b(a[159:152]), .y(level1[31:24]));
    or8b l1_4  (.a(a[39:32]),   .b(a[167:160]), .y(level1[39:32]));
    or8b l1_5  (.a(a[47:40]),   .b(a[175:168]), .y(level1[47:40]));
    or8b l1_6  (.a(a[55:48]),   .b(a[183:176]), .y(level1[55:48]));
    or8b l1_7  (.a(a[63:56]),   .b(a[191:184]), .y(level1[63:56]));
    
    or8b l1_8  (.a(a[71:64]),   .b(a[199:192]), .y(level1[71:64]));
    or8b l1_9  (.a(a[79:72]),   .b(a[207:200]), .y(level1[79:72]));
    or8b l1_10 (.a(a[87:80]),   .b(a[215:208]), .y(level1[87:80]));
    or8b l1_11 (.a(a[95:88]),   .b(a[223:216]), .y(level1[95:88]));
    or8b l1_12 (.a(a[103:96]),  .b(a[231:224]), .y(level1[103:96]));
    or8b l1_13 (.a(a[111:104]), .b(a[239:232]), .y(level1[111:104]));
    or8b l1_14 (.a(a[119:112]), .b(a[247:240]), .y(level1[119:112]));
    or8b l1_15 (.a(a[127:120]), .b(a[255:248]), .y(level1[127:120]));
    
    
    // 128 -> 64
    
    or8b l2_0 (.a(level1[7:0]),   .b(level1[71:64]),   .y(level2[7:0]));
    or8b l2_1 (.a(level1[15:8]),  .b(level1[79:72]),   .y(level2[15:8]));
    or8b l2_2 (.a(level1[23:16]), .b(level1[87:80]),   .y(level2[23:16]));
    or8b l2_3 (.a(level1[31:24]), .b(level1[95:88]),   .y(level2[31:24]));
    
    or8b l2_4 (.a(level1[39:32]), .b(level1[103:96]),  .y(level2[39:32]));
    or8b l2_5 (.a(level1[47:40]), .b(level1[111:104]), .y(level2[47:40]));
    or8b l2_6 (.a(level1[55:48]), .b(level1[119:112]), .y(level2[55:48]));
    or8b l2_7 (.a(level1[63:56]), .b(level1[127:120]), .y(level2[63:56]));
    
    
    // 64 -> 32
    
    or8b l3_0 (.a(level2[7:0]),   .b(level2[39:32]), .y(level3[7:0]));
    or8b l3_1 (.a(level2[15:8]),  .b(level2[47:40]), .y(level3[15:8]));
    or8b l3_2 (.a(level2[23:16]), .b(level2[55:48]), .y(level3[23:16]));
    or8b l3_3 (.a(level2[31:24]), .b(level2[63:56]), .y(level3[31:24]));
    
    
    // 32 -> 16
    
    or8b l4_0 (.a(level3[7:0]),  .b(level3[23:16]), .y(level4[7:0]));
    or8b l4_1 (.a(level3[15:8]), .b(level3[31:24]), .y(level4[15:8]));
    
    
    // 16 -> 8
    
    or8b l5_0 (.a(level4[7:0]), .b(level4[15:8]), .y(level5[7:0]));
    
    
    // 8 -> 4
    
    or_nand l6_0 (.a(level5[0]), .b(level5[4]), .y(level6[0]));
    or_nand l6_1 (.a(level5[1]), .b(level5[5]), .y(level6[1]));
    or_nand l6_2 (.a(level5[2]), .b(level5[6]), .y(level6[2]));
    or_nand l6_3 (.a(level5[3]), .b(level5[7]), .y(level6[3]));
    
    
    // 4 -> 2
    
    or_nand l7_0 (.a(level6[0]), .b(level6[2]), .y(level7[0]));
    or_nand l7_1 (.a(level6[1]), .b(level6[3]), .y(level7[1]));
    
    
    // 2 -> 1
    
    or_nand l8_0 (.a(level7[0]), .b(level7[1]), .y(y));

endmodule