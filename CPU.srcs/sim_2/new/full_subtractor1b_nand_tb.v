`timescale 1ns / 1ps

module full_subtractor1b_nand_tb;

    reg a, b, b_in;
    wire d, b_out;

    integer errors;

    full_subtractor1b_nand dut (
        .a(a),
        .b(b),
        .b_in(b_in),
        .d(d),
        .b_out(b_out)
    );

    initial begin

        errors = 0;

        $display("------------------------------------------------------");
        $display(" a | b | b_in | d | b_out | Expected | Result");
        $display("------------------------------------------------------");

        // 0 - 0 - 0
        a = 0; b = 0; b_in = 0;
        #10;
        if ((d == 0) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 0 - 0 - 1
        a = 0; b = 0; b_in = 1;
        #10;
        if ((d == 1) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 0 - 1 - 0
        a = 0; b = 1; b_in = 0;
        #10;
        if ((d == 1) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 0 - 1 - 1
        a = 0; b = 1; b_in = 1;
        #10;
        if ((d == 0) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |   0 1    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   0 1    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 1 - 0 - 0
        a = 1; b = 0; b_in = 0;
        #10;
        if ((d == 1) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |   1 0    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   1 0    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 1 - 0 - 1
        a = 1; b = 0; b_in = 1;
        #10;
        if ((d == 0) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 1 - 1 - 0
        a = 1; b = 1; b_in = 0;
        #10;
        if ((d == 0) && (b_out == 0))
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   0 0    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        // 1 - 1 - 1
        a = 1; b = 1; b_in = 1;
        #10;
        if ((d == 1) && (b_out == 1))
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | PASS",
                     a, b, b_in, d, b_out);
        else begin
            $display(" %b | %b |  %b   | %b |   %b   |   1 1    | FAIL",
                     a, b, b_in, d, b_out);
            errors = errors + 1;
        end

        $display("------------------------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("------------------------------------------------------");

        $finish;

    end

endmodule