`timescale 1ns / 1ps

module and_nand_tb;

    reg a, b;
    wire y;

    integer errors;

    // Instantiate DUT
    and_nand dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("--------------------------------");
        $display(" a | b | y | Expected | Result");
        $display("--------------------------------");

        // Test 00
        a = 0;
        b = 0;
        #10;

        if (y == 0)
            $display(" %b | %b | %b |    0     | PASS", a, b, y);
        else begin
            $display(" %b | %b | %b |    0     | FAIL", a, b, y);
            errors = errors + 1;
        end

        // Test 01
        a = 0;
        b = 1;
        #10;

        if (y == 0)
            $display(" %b | %b | %b |    0     | PASS", a, b, y);
        else begin
            $display(" %b | %b | %b |    0     | FAIL", a, b, y);
            errors = errors + 1;
        end

        // Test 10
        a = 1;
        b = 0;
        #10;

        if (y == 0)
            $display(" %b | %b | %b |    0     | PASS", a, b, y);
        else begin
            $display(" %b | %b | %b |    0     | FAIL", a, b, y);
            errors = errors + 1;
        end

        // Test 11
        a = 1;
        b = 1;
        #10;

        if (y == 1)
            $display(" %b | %b | %b |    1     | PASS", a, b, y);
        else begin
            $display(" %b | %b | %b |    1     | FAIL", a, b, y);
            errors = errors + 1;
        end

        $display("--------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("--------------------------------");

        $finish;

    end

endmodule
