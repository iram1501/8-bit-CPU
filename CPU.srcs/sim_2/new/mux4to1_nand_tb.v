`timescale 1ns / 1ps

module mux4to1_nand_tb;

    reg i0, i1, i2, i3;
    reg [1:0] s;
    wire y;

    integer errors;

    // Instantiate DUT
    mux4to1_nand dut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("----------------------------------------------------");
        $display(" s  | i0 | i1 | i2 | i3 | y | Expected | Result");
        $display("----------------------------------------------------");

        // s = 00, select i0 = 0
        s = 2'b00;
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;

        if (y == 0)
            $display(" 00 |  0 |  x |  x |  x | %b |    0     | PASS", y);
        else begin
            $display(" 00 |  0 |  x |  x |  x | %b |    0     | FAIL", y);
            errors = errors + 1;
        end


        // s = 00, select i0 = 1
        s = 2'b00;
        i0 = 1; i1 = 0; i2 = 0; i3 = 0;
        #10;

        if (y == 1)
            $display(" 00 |  1 |  x |  x |  x | %b |    1     | PASS", y);
        else begin
            $display(" 00 |  1 |  x |  x |  x | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // s = 01, select i1 = 0
        s = 2'b01;
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;

        if (y == 0)
            $display(" 01 |  x |  0 |  x |  x | %b |    0     | PASS", y);
        else begin
            $display(" 01 |  x |  0 |  x |  x | %b |    0     | FAIL", y);
            errors = errors + 1;
        end


        // s = 01, select i1 = 1
        s = 2'b01;
        i0 = 0; i1 = 1; i2 = 0; i3 = 0;
        #10;

        if (y == 1)
            $display(" 01 |  x |  1 |  x |  x | %b |    1     | PASS", y);
        else begin
            $display(" 01 |  x |  1 |  x |  x | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // s = 10, select i2 = 0
        s = 2'b10;
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;

        if (y == 0)
            $display(" 10 |  x |  x |  0 |  x | %b |    0     | PASS", y);
        else begin
            $display(" 10 |  x |  x |  0 |  x | %b |    0     | FAIL", y);
            errors = errors + 1;
        end


        // s = 10, select i2 = 1
        s = 2'b10;
        i0 = 0; i1 = 0; i2 = 1; i3 = 0;
        #10;

        if (y == 1)
            $display(" 10 |  x |  x |  1 |  x | %b |    1     | PASS", y);
        else begin
            $display(" 10 |  x |  x |  1 |  x | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // s = 11, select i3 = 0
        s = 2'b11;
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;

        if (y == 0)
            $display(" 11 |  x |  x |  x |  0 | %b |    0     | PASS", y);
        else begin
            $display(" 11 |  x |  x |  x |  0 | %b |    0     | FAIL", y);
            errors = errors + 1;
        end


        // s = 11, select i3 = 1
        s = 2'b11;
        i0 = 0; i1 = 0; i2 = 0; i3 = 1;
        #10;

        if (y == 1)
            $display(" 11 |  x |  x |  x |  1 | %b |    1     | PASS", y);
        else begin
            $display(" 11 |  x |  x |  x |  1 | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        $display("----------------------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("----------------------------------------------------");

        $finish;

    end

endmodule