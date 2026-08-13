`timescale 1ns / 1ps

module full_adder_1b_tb;

    reg a, b, c_in;
    wire sum, c_out;

    integer errors;

    // Instantiate DUT
    full_adder_1b dut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin

        errors = 0;

        $display("-----------------------------------------------------");
        $display(" a | b | c_in | sum | c_out | Expected | Result");
        $display("-----------------------------------------------------");

        // 000
        a = 0; b = 0; c_in = 0;
        #10;
        if ((sum == 0) && (c_out == 0))
            $display(" %b | %b |  %b   |  %b  |   %b   |   00     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   00     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 001
        a = 0; b = 0; c_in = 1;
        #10;
        if ((sum == 1) && (c_out == 0))
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 010
        a = 0; b = 1; c_in = 0;
        #10;
        if ((sum == 1) && (c_out == 0))
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 011
        a = 0; b = 1; c_in = 1;
        #10;
        if ((sum == 0) && (c_out == 1))
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 100
        a = 1; b = 0; c_in = 0;
        #10;
        if ((sum == 1) && (c_out == 0))
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   10     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 101
        a = 1; b = 0; c_in = 1;
        #10;
        if ((sum == 0) && (c_out == 1))
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 110
        a = 1; b = 1; c_in = 0;
        #10;
        if ((sum == 0) && (c_out == 1))
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   01     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        // 111
        a = 1; b = 1; c_in = 1;
        #10;
        if ((sum == 1) && (c_out == 1))
            $display(" %b | %b |  %b   |  %b  |   %b   |   11     | PASS",
                     a, b, c_in, sum, c_out);
        else begin
            $display(" %b | %b |  %b   |  %b  |   %b   |   11     | FAIL",
                     a, b, c_in, sum, c_out);
            errors = errors + 1;
        end

        $display("-----------------------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("-----------------------------------------------------");

        $finish;

    end

endmodule