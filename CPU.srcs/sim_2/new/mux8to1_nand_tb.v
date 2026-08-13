`timescale 1ns / 1ps

module mux8to1_nand_tb;

    reg i0, i1, i2, i3;
    reg i4, i5, i6, i7;
    reg [2:0] s;

    wire y;

    integer errors;

    mux8to1_nand dut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .s(s),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("--------------------------------------");
        $display("  s  | Selected | y | Expected | Result");
        $display("--------------------------------------");

        // Select i0
        s = 3'b000;
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        i4 = 0; i5 = 0; i6 = 0; i7 = 0;
        #10;

        if (y == 0)
            $display(" 000 |  i0 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 000 |  i0 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i0 = 1;
        #10;

        if (y == 1)
            $display(" 000 |  i0 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 000 |  i0 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i1
        s = 3'b001;
        i1 = 0;
        #10;

        if (y == 0)
            $display(" 001 |  i1 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 001 |  i1 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i1 = 1;
        #10;

        if (y == 1)
            $display(" 001 |  i1 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 001 |  i1 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i2
        s = 3'b010;
        i2 = 0;
        #10;

        if (y == 0)
            $display(" 010 |  i2 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 010 |  i2 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i2 = 1;
        #10;

        if (y == 1)
            $display(" 010 |  i2 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 010 |  i2 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i3
        s = 3'b011;
        i3 = 0;
        #10;

        if (y == 0)
            $display(" 011 |  i3 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 011 |  i3 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i3 = 1;
        #10;

        if (y == 1)
            $display(" 011 |  i3 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 011 |  i3 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i4
        s = 3'b100;
        i4 = 0;
        #10;

        if (y == 0)
            $display(" 100 |  i4 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 100 |  i4 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i4 = 1;
        #10;

        if (y == 1)
            $display(" 100 |  i4 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 100 |  i4 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i5
        s = 3'b101;
        i5 = 0;
        #10;

        if (y == 0)
            $display(" 101 |  i5 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 101 |  i5 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i5 = 1;
        #10;

        if (y == 1)
            $display(" 101 |  i5 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 101 |  i5 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i6
        s = 3'b110;
        i6 = 0;
        #10;

        if (y == 0)
            $display(" 110 |  i6 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 110 |  i6 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i6 = 1;
        #10;

        if (y == 1)
            $display(" 110 |  i6 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 110 |  i6 = 1  | %b |    1     | FAIL", y);
            errors = errors + 1;
        end


        // Select i7
        s = 3'b111;
        i7 = 0;
        #10;

        if (y == 0)
            $display(" 111 |  i7 = 0  | %b |    0     | PASS", y);
        else begin
            $display(" 111 |  i7 = 0  | %b |    0     | FAIL", y);
            errors = errors + 1;
        end

        i7 = 1;
        #10;

        if (y == 1)
            $display(" 111 |  i7 = 1  | %b |    1     | PASS", y);
        else begin
            $display(" 111 |  i7 = 1  | %b |    1     | FAIL", y);
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