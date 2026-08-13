`timescale 1ns / 1ps

module right_shift4b_nand_tb;

    reg  [3:0] a;
    wire [3:0] y;

    integer errors;

    right_shift4b_nand dut (
        .a(a),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("--------------------------------------");
        $display("   a   |   y   | Expected | Result");
        $display("--------------------------------------");

        // 0000 >> 1 = 0000
        a = 4'b0000;
        #10;

        if (y == 4'b0000)
            $display(" %b | %b |   0000   | PASS", a, y);
        else begin
            $display(" %b | %b |   0000   | FAIL", a, y);
            errors = errors + 1;
        end

        // 0001 >> 1 = 0000
        a = 4'b0001;
        #10;

        if (y == 4'b0000)
            $display(" %b | %b |   0000   | PASS", a, y);
        else begin
            $display(" %b | %b |   0000   | FAIL", a, y);
            errors = errors + 1;
        end

        // 0010 >> 1 = 0001
        a = 4'b0010;
        #10;

        if (y == 4'b0001)
            $display(" %b | %b |   0001   | PASS", a, y);
        else begin
            $display(" %b | %b |   0001   | FAIL", a, y);
            errors = errors + 1;
        end

        // 1010 >> 1 = 0101
        a = 4'b1010;
        #10;

        if (y == 4'b0101)
            $display(" %b | %b |   0101   | PASS", a, y);
        else begin
            $display(" %b | %b |   0101   | FAIL", a, y);
            errors = errors + 1;
        end

        // 1111 >> 1 = 0111
        a = 4'b1111;
        #10;

        if (y == 4'b0111)
            $display(" %b | %b |   0111   | PASS", a, y);
        else begin
            $display(" %b | %b |   0111   | FAIL", a, y);
            errors = errors + 1;
        end

        // 1000 >> 1 = 0100
        a = 4'b1000;
        #10;

        if (y == 4'b0100)
            $display(" %b | %b |   0100   | PASS", a, y);
        else begin
            $display(" %b | %b |   0100   | FAIL", a, y);
            errors = errors + 1;
        end

        $display("--------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("--------------------------------------");

        $finish;

    end

endmodule