`timescale 1ns / 1ps
module decoder8x256(
    input [7:0] s,     //instead of trying to type out 256 y's 
    output [255:0] y   //i am opting to use a 256 bit bus for y
    );
    
    //the program essesntially makes a 16x16 grid and maps every upper to every lower
    
    wire U0, U1, U2, U3, U4, U5, U6, U7, U8, U9, U10, U11, U12, U13, U14, U15;
    wire L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15;
    
    decoder4x16 upper (.s(s[7:4]), .y0(U0), .y1(U1), .y2(U2), .y3(U3), 
                       .y4(U4), .y5(U5), .y6(U6), .y7(U7), .y8(U8), 
                       .y9(U9), .y10(U10), .y11(U11), .y12(U12), 
                       .y13(U13), .y14(U14), .y15(U15));
                       
    decoder4x16 lower (.s(s[3:0]), .y0(L0), .y1(L1), .y2(L2), .y3(L3), 
                       .y4(L4), .y5(L5), .y6(L6), .y7(L7), .y8(L8), 
                       .y9(L9), .y10(L10), .y11(L11), .y12(L12), 
                       .y13(L13), .y14(L14), .y15(L15));
    
    // maps U0 to L0-L15 and puts the output into y[15:0]
    and_nand a0 (.a(U0), .b(L0), .y(y[0]));
    and_nand a1 (.a(U0), .b(L1), .y(y[1]));
    and_nand a2 (.a(U0), .b(L2), .y(y[2]));
    and_nand a3 (.a(U0), .b(L3), .y(y[3]));
    and_nand a4 (.a(U0), .b(L4), .y(y[4]));
    and_nand a5 (.a(U0), .b(L5), .y(y[5]));
    and_nand a6 (.a(U0), .b(L6), .y(y[6]));
    and_nand a7 (.a(U0), .b(L7), .y(y[7]));
    and_nand a8 (.a(U0), .b(L8), .y(y[8]));
    and_nand a9 (.a(U0), .b(L9), .y(y[9]));
    and_nand a10 (.a(U0), .b(L10), .y(y[10]));
    and_nand a11 (.a(U0), .b(L11), .y(y[11]));
    and_nand a12 (.a(U0), .b(L12), .y(y[12]));
    and_nand a13 (.a(U0), .b(L13), .y(y[13]));
    and_nand a14 (.a(U0), .b(L14), .y(y[14]));
    and_nand a15 (.a(U0), .b(L15), .y(y[15]));
    
    // maps U1 to L0-L15 and puts the output into y[31:16]
    and_nand a16 (.a(U1), .b(L0), .y(y[16]));
    and_nand a17 (.a(U1), .b(L1), .y(y[17]));
    and_nand a18 (.a(U1), .b(L2), .y(y[18]));
    and_nand a19 (.a(U1), .b(L3), .y(y[19]));
    and_nand a20 (.a(U1), .b(L4), .y(y[20]));
    and_nand a21 (.a(U1), .b(L5), .y(y[21]));
    and_nand a22 (.a(U1), .b(L6), .y(y[22]));
    and_nand a23 (.a(U1), .b(L7), .y(y[23]));
    and_nand a24 (.a(U1), .b(L8), .y(y[24]));
    and_nand a25 (.a(U1), .b(L9), .y(y[25]));
    and_nand a26 (.a(U1), .b(L10), .y(y[26]));
    and_nand a27 (.a(U1), .b(L11), .y(y[27]));
    and_nand a28 (.a(U1), .b(L12), .y(y[28]));
    and_nand a29 (.a(U1), .b(L13), .y(y[29]));
    and_nand a30 (.a(U1), .b(L14), .y(y[30]));
    and_nand a31 (.a(U1), .b(L15), .y(y[31]));
    
    // maps U2 to L0-L15 and puts the output into y[47:32]
    and_nand a32 (.a(U2), .b(L0), .y(y[32]));
    and_nand a33 (.a(U2), .b(L1), .y(y[33]));
    and_nand a34 (.a(U2), .b(L2), .y(y[34]));
    and_nand a35 (.a(U2), .b(L3), .y(y[35]));
    and_nand a36 (.a(U2), .b(L4), .y(y[36]));
    and_nand a37 (.a(U2), .b(L5), .y(y[37]));
    and_nand a38 (.a(U2), .b(L6), .y(y[38]));
    and_nand a39 (.a(U2), .b(L7), .y(y[39]));
    and_nand a40 (.a(U2), .b(L8), .y(y[40]));
    and_nand a41 (.a(U2), .b(L9), .y(y[41]));
    and_nand a42 (.a(U2), .b(L10), .y(y[42]));
    and_nand a43 (.a(U2), .b(L11), .y(y[43]));
    and_nand a44 (.a(U2), .b(L12), .y(y[44]));
    and_nand a45 (.a(U2), .b(L13), .y(y[45]));
    and_nand a46 (.a(U2), .b(L14), .y(y[46]));
    and_nand a47 (.a(U2), .b(L15), .y(y[47]));
    
    // maps U3 to L0-L15 and puts the output into y[63:48]
    and_nand a48 (.a(U3), .b(L0), .y(y[48]));
    and_nand a49 (.a(U3), .b(L1), .y(y[49]));
    and_nand a50 (.a(U3), .b(L2), .y(y[50]));
    and_nand a51 (.a(U3), .b(L3), .y(y[51]));
    and_nand a52 (.a(U3), .b(L4), .y(y[52]));
    and_nand a53 (.a(U3), .b(L5), .y(y[53]));
    and_nand a54 (.a(U3), .b(L6), .y(y[54]));
    and_nand a55 (.a(U3), .b(L7), .y(y[55]));
    and_nand a56 (.a(U3), .b(L8), .y(y[56]));
    and_nand a57 (.a(U3), .b(L9), .y(y[57]));
    and_nand a58 (.a(U3), .b(L10), .y(y[58]));
    and_nand a59 (.a(U3), .b(L11), .y(y[59]));
    and_nand a60 (.a(U3), .b(L12), .y(y[60]));
    and_nand a61 (.a(U3), .b(L13), .y(y[61]));
    and_nand a62 (.a(U3), .b(L14), .y(y[62]));
    and_nand a63 (.a(U3), .b(L15), .y(y[63]));
    
    // maps U4 to L0-L15 and puts the output into y[79:64]
    and_nand a64 (.a(U4), .b(L0), .y(y[64]));
    and_nand a65 (.a(U4), .b(L1), .y(y[65]));
    and_nand a66 (.a(U4), .b(L2), .y(y[66]));
    and_nand a67 (.a(U4), .b(L3), .y(y[67]));
    and_nand a68 (.a(U4), .b(L4), .y(y[68]));
    and_nand a69 (.a(U4), .b(L5), .y(y[69]));
    and_nand a70 (.a(U4), .b(L6), .y(y[70]));
    and_nand a71 (.a(U4), .b(L7), .y(y[71]));
    and_nand a72 (.a(U4), .b(L8), .y(y[72]));
    and_nand a73 (.a(U4), .b(L9), .y(y[73]));
    and_nand a74 (.a(U4), .b(L10), .y(y[74]));
    and_nand a75 (.a(U4), .b(L11), .y(y[75]));
    and_nand a76 (.a(U4), .b(L12), .y(y[76]));
    and_nand a77 (.a(U4), .b(L13), .y(y[77]));
    and_nand a78 (.a(U4), .b(L14), .y(y[78]));
    and_nand a79 (.a(U4), .b(L15), .y(y[79]));
    
    // maps U5 to L0-L15 and puts the output into y[95:80]
    and_nand a80 (.a(U5), .b(L0), .y(y[80]));
    and_nand a81 (.a(U5), .b(L1), .y(y[81]));
    and_nand a82 (.a(U5), .b(L2), .y(y[82]));
    and_nand a83 (.a(U5), .b(L3), .y(y[83]));
    and_nand a84 (.a(U5), .b(L4), .y(y[84]));
    and_nand a85 (.a(U5), .b(L5), .y(y[85]));
    and_nand a86 (.a(U5), .b(L6), .y(y[86]));
    and_nand a87 (.a(U5), .b(L7), .y(y[87]));
    and_nand a88 (.a(U5), .b(L8), .y(y[88]));
    and_nand a89 (.a(U5), .b(L9), .y(y[89]));
    and_nand a90 (.a(U5), .b(L10), .y(y[90]));
    and_nand a91 (.a(U5), .b(L11), .y(y[91]));
    and_nand a92 (.a(U5), .b(L12), .y(y[92]));
    and_nand a93 (.a(U5), .b(L13), .y(y[93]));
    and_nand a94 (.a(U5), .b(L14), .y(y[94]));
    and_nand a95 (.a(U5), .b(L15), .y(y[95]));
    
    // maps U6 to L0-L15 and puts the output into y[111:96]
    and_nand a96  (.a(U6), .b(L0), .y(y[96]));
    and_nand a97  (.a(U6), .b(L1), .y(y[97]));
    and_nand a98  (.a(U6), .b(L2), .y(y[98]));
    and_nand a99  (.a(U6), .b(L3), .y(y[99]));
    and_nand a100 (.a(U6), .b(L4), .y(y[100]));
    and_nand a101 (.a(U6), .b(L5), .y(y[101]));
    and_nand a102 (.a(U6), .b(L6), .y(y[102]));
    and_nand a103 (.a(U6), .b(L7), .y(y[103]));
    and_nand a104 (.a(U6), .b(L8), .y(y[104]));
    and_nand a105 (.a(U6), .b(L9), .y(y[105]));
    and_nand a106 (.a(U6), .b(L10), .y(y[106]));
    and_nand a107 (.a(U6), .b(L11), .y(y[107]));
    and_nand a108 (.a(U6), .b(L12), .y(y[108]));
    and_nand a109 (.a(U6), .b(L13), .y(y[109]));
    and_nand a110 (.a(U6), .b(L14), .y(y[110]));
    and_nand a111 (.a(U6), .b(L15), .y(y[111]));
    
    // maps U7 to L0-L15 and puts the output into y[127:112]
    and_nand a112 (.a(U7), .b(L0), .y(y[112]));
    and_nand a113 (.a(U7), .b(L1), .y(y[113]));
    and_nand a114 (.a(U7), .b(L2), .y(y[114]));
    and_nand a115 (.a(U7), .b(L3), .y(y[115]));
    and_nand a116 (.a(U7), .b(L4), .y(y[116]));
    and_nand a117 (.a(U7), .b(L5), .y(y[117]));
    and_nand a118 (.a(U7), .b(L6), .y(y[118]));
    and_nand a119 (.a(U7), .b(L7), .y(y[119]));
    and_nand a120 (.a(U7), .b(L8), .y(y[120]));
    and_nand a121 (.a(U7), .b(L9), .y(y[121]));
    and_nand a122 (.a(U7), .b(L10), .y(y[122]));
    and_nand a123 (.a(U7), .b(L11), .y(y[123]));
    and_nand a124 (.a(U7), .b(L12), .y(y[124]));
    and_nand a125 (.a(U7), .b(L13), .y(y[125]));
    and_nand a126 (.a(U7), .b(L14), .y(y[126]));
    and_nand a127 (.a(U7), .b(L15), .y(y[127]));
    
    // maps U8 to L0-L15 and puts the output into y[143:128]
    and_nand a128 (.a(U8), .b(L0), .y(y[128]));
    and_nand a129 (.a(U8), .b(L1), .y(y[129]));
    and_nand a130 (.a(U8), .b(L2), .y(y[130]));
    and_nand a131 (.a(U8), .b(L3), .y(y[131]));
    and_nand a132 (.a(U8), .b(L4), .y(y[132]));
    and_nand a133 (.a(U8), .b(L5), .y(y[133]));
    and_nand a134 (.a(U8), .b(L6), .y(y[134]));
    and_nand a135 (.a(U8), .b(L7), .y(y[135]));
    and_nand a136 (.a(U8), .b(L8), .y(y[136]));
    and_nand a137 (.a(U8), .b(L9), .y(y[137]));
    and_nand a138 (.a(U8), .b(L10), .y(y[138]));
    and_nand a139 (.a(U8), .b(L11), .y(y[139]));
    and_nand a140 (.a(U8), .b(L12), .y(y[140]));
    and_nand a141 (.a(U8), .b(L13), .y(y[141]));
    and_nand a142 (.a(U8), .b(L14), .y(y[142]));
    and_nand a143 (.a(U8), .b(L15), .y(y[143]));
    
    // maps U9 to L0-L15 and puts the output into y[159:144]
    and_nand a144 (.a(U9), .b(L0), .y(y[144]));
    and_nand a145 (.a(U9), .b(L1), .y(y[145]));
    and_nand a146 (.a(U9), .b(L2), .y(y[146]));
    and_nand a147 (.a(U9), .b(L3), .y(y[147]));
    and_nand a148 (.a(U9), .b(L4), .y(y[148]));
    and_nand a149 (.a(U9), .b(L5), .y(y[149]));
    and_nand a150 (.a(U9), .b(L6), .y(y[150]));
    and_nand a151 (.a(U9), .b(L7), .y(y[151]));
    and_nand a152 (.a(U9), .b(L8), .y(y[152]));
    and_nand a153 (.a(U9), .b(L9), .y(y[153]));
    and_nand a154 (.a(U9), .b(L10), .y(y[154]));
    and_nand a155 (.a(U9), .b(L11), .y(y[155]));
    and_nand a156 (.a(U9), .b(L12), .y(y[156]));
    and_nand a157 (.a(U9), .b(L13), .y(y[157]));
    and_nand a158 (.a(U9), .b(L14), .y(y[158]));
    and_nand a159 (.a(U9), .b(L15), .y(y[159]));
    
    // maps U10 to L0-L15 and puts the output into y[175:160]
    and_nand a160 (.a(U10), .b(L0), .y(y[160]));
    and_nand a161 (.a(U10), .b(L1), .y(y[161]));
    and_nand a162 (.a(U10), .b(L2), .y(y[162]));
    and_nand a163 (.a(U10), .b(L3), .y(y[163]));
    and_nand a164 (.a(U10), .b(L4), .y(y[164]));
    and_nand a165 (.a(U10), .b(L5), .y(y[165]));
    and_nand a166 (.a(U10), .b(L6), .y(y[166]));
    and_nand a167 (.a(U10), .b(L7), .y(y[167]));
    and_nand a168 (.a(U10), .b(L8), .y(y[168]));
    and_nand a169 (.a(U10), .b(L9), .y(y[169]));
    and_nand a170 (.a(U10), .b(L10), .y(y[170]));
    and_nand a171 (.a(U10), .b(L11), .y(y[171]));
    and_nand a172 (.a(U10), .b(L12), .y(y[172]));
    and_nand a173 (.a(U10), .b(L13), .y(y[173]));
    and_nand a174 (.a(U10), .b(L14), .y(y[174]));
    and_nand a175 (.a(U10), .b(L15), .y(y[175]));
    
    // maps U11 to L0-L15 and puts the output into y[191:176]
    and_nand a176 (.a(U11), .b(L0), .y(y[176]));
    and_nand a177 (.a(U11), .b(L1), .y(y[177]));
    and_nand a178 (.a(U11), .b(L2), .y(y[178]));
    and_nand a179 (.a(U11), .b(L3), .y(y[179]));
    and_nand a180 (.a(U11), .b(L4), .y(y[180]));
    and_nand a181 (.a(U11), .b(L5), .y(y[181]));
    and_nand a182 (.a(U11), .b(L6), .y(y[182]));
    and_nand a183 (.a(U11), .b(L7), .y(y[183]));
    and_nand a184 (.a(U11), .b(L8), .y(y[184]));
    and_nand a185 (.a(U11), .b(L9), .y(y[185]));
    and_nand a186 (.a(U11), .b(L10), .y(y[186]));
    and_nand a187 (.a(U11), .b(L11), .y(y[187]));
    and_nand a188 (.a(U11), .b(L12), .y(y[188]));
    and_nand a189 (.a(U11), .b(L13), .y(y[189]));
    and_nand a190 (.a(U11), .b(L14), .y(y[190]));
    and_nand a191 (.a(U11), .b(L15), .y(y[191]));
    
    // maps U12 to L0-L15 and puts the output into y[207:192]
    and_nand a192 (.a(U12), .b(L0), .y(y[192]));
    and_nand a193 (.a(U12), .b(L1), .y(y[193]));
    and_nand a194 (.a(U12), .b(L2), .y(y[194]));
    and_nand a195 (.a(U12), .b(L3), .y(y[195]));
    and_nand a196 (.a(U12), .b(L4), .y(y[196]));
    and_nand a197 (.a(U12), .b(L5), .y(y[197]));
    and_nand a198 (.a(U12), .b(L6), .y(y[198]));
    and_nand a199 (.a(U12), .b(L7), .y(y[199]));
    and_nand a200 (.a(U12), .b(L8), .y(y[200]));
    and_nand a201 (.a(U12), .b(L9), .y(y[201]));
    and_nand a202 (.a(U12), .b(L10), .y(y[202]));
    and_nand a203 (.a(U12), .b(L11), .y(y[203]));
    and_nand a204 (.a(U12), .b(L12), .y(y[204]));
    and_nand a205 (.a(U12), .b(L13), .y(y[205]));
    and_nand a206 (.a(U12), .b(L14), .y(y[206]));
    and_nand a207 (.a(U12), .b(L15), .y(y[207]));
    
    // maps U13 to L0-L15 and puts the output into y[223:208]
    and_nand a208 (.a(U13), .b(L0), .y(y[208]));
    and_nand a209 (.a(U13), .b(L1), .y(y[209]));
    and_nand a210 (.a(U13), .b(L2), .y(y[210]));
    and_nand a211 (.a(U13), .b(L3), .y(y[211]));
    and_nand a212 (.a(U13), .b(L4), .y(y[212]));
    and_nand a213 (.a(U13), .b(L5), .y(y[213]));
    and_nand a214 (.a(U13), .b(L6), .y(y[214]));
    and_nand a215 (.a(U13), .b(L7), .y(y[215]));
    and_nand a216 (.a(U13), .b(L8), .y(y[216]));
    and_nand a217 (.a(U13), .b(L9), .y(y[217]));
    and_nand a218 (.a(U13), .b(L10), .y(y[218]));
    and_nand a219 (.a(U13), .b(L11), .y(y[219]));
    and_nand a220 (.a(U13), .b(L12), .y(y[220]));
    and_nand a221 (.a(U13), .b(L13), .y(y[221]));
    and_nand a222 (.a(U13), .b(L14), .y(y[222]));
    and_nand a223 (.a(U13), .b(L15), .y(y[223]));
    
    // maps U14 to L0-L15 and puts the output into y[239:224]
    and_nand a224 (.a(U14), .b(L0), .y(y[224]));
    and_nand a225 (.a(U14), .b(L1), .y(y[225]));
    and_nand a226 (.a(U14), .b(L2), .y(y[226]));
    and_nand a227 (.a(U14), .b(L3), .y(y[227]));
    and_nand a228 (.a(U14), .b(L4), .y(y[228]));
    and_nand a229 (.a(U14), .b(L5), .y(y[229]));
    and_nand a230 (.a(U14), .b(L6), .y(y[230]));
    and_nand a231 (.a(U14), .b(L7), .y(y[231]));
    and_nand a232 (.a(U14), .b(L8), .y(y[232]));
    and_nand a233 (.a(U14), .b(L9), .y(y[233]));
    and_nand a234 (.a(U14), .b(L10), .y(y[234]));
    and_nand a235 (.a(U14), .b(L11), .y(y[235]));
    and_nand a236 (.a(U14), .b(L12), .y(y[236]));
    and_nand a237 (.a(U14), .b(L13), .y(y[237]));
    and_nand a238 (.a(U14), .b(L14), .y(y[238]));
    and_nand a239 (.a(U14), .b(L15), .y(y[239]));
    
    // maps U15 to L0-L15 and puts the output into y[255:240]
    and_nand a240 (.a(U15), .b(L0), .y(y[240]));
    and_nand a241 (.a(U15), .b(L1), .y(y[241]));
    and_nand a242 (.a(U15), .b(L2), .y(y[242]));
    and_nand a243 (.a(U15), .b(L3), .y(y[243]));
    and_nand a244 (.a(U15), .b(L4), .y(y[244]));
    and_nand a245 (.a(U15), .b(L5), .y(y[245]));
    and_nand a246 (.a(U15), .b(L6), .y(y[246]));
    and_nand a247 (.a(U15), .b(L7), .y(y[247]));
    and_nand a248 (.a(U15), .b(L8), .y(y[248]));
    and_nand a249 (.a(U15), .b(L9), .y(y[249]));
    and_nand a250 (.a(U15), .b(L10), .y(y[250]));
    and_nand a251 (.a(U15), .b(L11), .y(y[251]));
    and_nand a252 (.a(U15), .b(L12), .y(y[252]));
    and_nand a253 (.a(U15), .b(L13), .y(y[253]));
    and_nand a254 (.a(U15), .b(L14), .y(y[254]));
    and_nand a255 (.a(U15), .b(L15), .y(y[255]));
    
    
endmodule
