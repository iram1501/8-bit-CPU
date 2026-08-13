`timescale 1ns / 1ps

module alu4b_nand_tb;

    reg  [3:0] a, b;
    reg  [2:0] alu_op;
    wire [3:0] y;

    alu4b_nand dut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .y(y)
    );

    initial begin

        a = 4'b0101;   // 5
        b = 4'b0011;   // 3

        // ADD: 5 + 3 = 8
        alu_op = 3'b000;
        #10;
        if (y == 4'b1000)
            $display("PASS ADD: y = %b", y);
        else
            $display("FAIL ADD: expected 1000, got %b", y);

        // SUB: 5 - 3 = 2
        alu_op = 3'b001;
        #10;
        if (y == 4'b0010)
            $display("PASS SUB: y = %b", y);
        else
            $display("FAIL SUB: expected 0010, got %b", y);

        // AND: 0101 & 0011 = 0001
        alu_op = 3'b010;
        #10;
        if (y == 4'b0001)
            $display("PASS AND: y = %b", y);
        else
            $display("FAIL AND: expected 0001, got %b", y);

        // OR: 0101 | 0011 = 0111
        alu_op = 3'b011;
        #10;
        if (y == 4'b0111)
            $display("PASS OR: y = %b", y);
        else
            $display("FAIL OR: expected 0111, got %b", y);

        // XOR: 0101 ^ 0011 = 0110
        alu_op = 3'b100;
        #10;
        if (y == 4'b0110)
            $display("PASS XOR: y = %b", y);
        else
            $display("FAIL XOR: expected 0110, got %b", y);

        // NOT A: ~0101 = 1010
        alu_op = 3'b101;
        #10;
        if (y == 4'b1010)
            $display("PASS NOT: y = %b", y);
        else
            $display("FAIL NOT: expected 1010, got %b", y);

        // SHIFT LEFT: 0101 << 1 = 1010
        alu_op = 3'b110;
        #10;
        if (y == 4'b1010)
            $display("PASS SHL: y = %b", y);
        else
            $display("FAIL SHL: expected 1010, got %b", y);

        // SHIFT RIGHT: 0101 >> 1 = 0010
        alu_op = 3'b111;
        #10;
        if (y == 4'b0010)
            $display("PASS SHR: y = %b", y);
        else
            $display("FAIL SHR: expected 0010, got %b", y);

        $display("ALU test complete.");
        $finish;

    end

endmodule