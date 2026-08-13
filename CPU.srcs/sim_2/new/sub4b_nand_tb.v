`timescale 1ns / 1ps

module sub4b_nand_tb;

    reg [3:0] a, b;
    reg b_in;

    wire [3:0] d;
    wire b_out;

    integer errors;

    // Instantiate DUT
    sub4b_nand dut (
        .a(a),
        .b(b),
        .b_in(b_in),
        .d(d),
        .b_out(b_out)
    );

    initial begin

        errors = 0;

        $display("----------------------------------------------------------");
        $display("   a   |   b   | b_in |   d   | b_out | Expected | Result");
        $display("----------------------------------------------------------");

        // 5 - 3 = 2
        a = 4'b0101;
        b = 4'b0011;
        b_in = 0;
        #10;

        if ((d == 4'b0010) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |  0_0010  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  0_0010  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // 10 - 4 = 6
        a = 4'b1010;
        b = 4'b0100;
        b_in = 0;
        #10;

        if ((d == 4'b0110) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |  0_0110  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  0_0110  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // 15 - 15 = 0
        a = 4'b1111;
        b = 4'b1111;
        b_in = 0;
        #10;

        if ((d == 4'b0000) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |  0_0000  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  0_0000  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // 3 - 5 = -2
        // 4-bit result = 1110, borrow = 1
        a = 4'b0011;
        b = 4'b0101;
        b_in = 0;
        #10;

        if ((d == 4'b1110) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |  1_1110  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  1_1110  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // 0 - 1 = -1
        // 4-bit result = 1111, borrow = 1
        a = 4'b0000;
        b = 4'b0001;
        b_in = 0;
        #10;

        if ((d == 4'b1111) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |  1_1111  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  1_1111  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // Test borrow-in: 5 - 3 - 1 = 1
        a = 4'b0101;
        b = 4'b0011;
        b_in = 1;
        #10;

        if ((d == 4'b0001) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |  0_0001  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  0_0001  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        // Test borrow-in causing borrow: 0 - 0 - 1 = -1
        a = 4'b0000;
        b = 4'b0000;
        b_in = 1;
        #10;

        if ((d == 4'b1111) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |  1_1111  | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |  1_1111  | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end


        $display("----------------------------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("----------------------------------------------------------");

        $finish;

    end

endmodule