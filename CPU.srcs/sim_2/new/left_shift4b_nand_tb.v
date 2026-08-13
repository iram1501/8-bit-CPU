`timescale 1ns / 1ps

module left_shift4b_nand_tb;

    reg  [3:0] a;
    wire [3:0] y;

    integer errors;

    left_shift4b_nand dut (
        .a(a),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("--------------------------------------");
        $display("   a   |   y   | Expected | Result");
        $display("--------------------------------------");

        // 0000 << 1 = 0000
        a = 4'b0000;
        #10;

        if (y == 4'b0000)
            $display(" %b | %b |   0000   | PASS", a, y);
        else begin
            $display(" %b | %b |   0000   | FAIL", a, y);
            errors = errors + 1;
        end


        // 0001 << 1 = 0010
        a = 4'b0001;
        #10;

        if (y == 4'b0010)
            $display(" %b | %b |   0010   | PASS", a, y);
        else begin
            $display(" %b | %b |   0010   | FAIL", a, y);
            errors = errors + 1;
        end


        // 0011 << 1 = 0110
        a = 4'b0011;
        #10;

        if (y == 4'b0110)
            $display(" %b | %b |   0110   | PASS", a, y);
        else begin
            $display(" %b | %b |   0110   | FAIL", a, y);
            errors = errors + 1;
        end


        // 0101 << 1 = 1010
        a = 4'b0101;
        #10;

        if (y == 4'b1010)
            $display(" %b | %b |   1010   | PASS", a, y);
        else begin
            $display(" %b | %b |   1010   | FAIL", a, y);
            errors = errors + 1;
        end


        // 1011 << 1 = 0110
        // MSB is shifted out
        a = 4'b1011;
        #10;

        if (y == 4'b0110)
            $display(" %b | %b |   0110   | PASS", a, y);
        else begin
            $display(" %b | %b |   0110   | FAIL", a, y);
            errors = errors + 1;
        end


        // 1111 << 1 = 1110
        a = 4'b1111;
        #10;

        if (y == 4'b1110)
            $display(" %b | %b |   1110   | PASS", a, y);
        else begin
            $display(" %b | %b |   1110   | FAIL", a, y);
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