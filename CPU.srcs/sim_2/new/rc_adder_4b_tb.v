`timescale 1ns / 1ps

module rc_adder_4b_tb;

    reg [3:0] a, b;
    reg c_in;

    wire [3:0] sum;
    wire c_out;

    integer errors;

    // Instantiate DUT
    rc_adder_4b dut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin

        errors = 0;

        $display("----------------------------------------------------------");
        $display("   a   |   b   | c_in | c_out |  sum  | Expected | Result");
        $display("----------------------------------------------------------");

        // 0 + 0 + 0 = 0
        a = 4'b0000;
        b = 4'b0000;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b00000)
            $display(" %b | %b |  %b   |   %b   | %b |  00000   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  00000   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // 3 + 2 = 5
        a = 4'b0011;
        b = 4'b0010;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b00101)
            $display(" %b | %b |  %b   |   %b   | %b |  00101   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  00101   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // 5 + 6 = 11
        a = 4'b0101;
        b = 4'b0110;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b01011)
            $display(" %b | %b |  %b   |   %b   | %b |  01011   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  01011   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // 7 + 8 = 15
        a = 4'b0111;
        b = 4'b1000;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b01111)
            $display(" %b | %b |  %b   |   %b   | %b |  01111   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  01111   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // 15 + 1 = 16
        a = 4'b1111;
        b = 4'b0001;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b10000)
            $display(" %b | %b |  %b   |   %b   | %b |  10000   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  10000   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // 15 + 15 = 30
        a = 4'b1111;
        b = 4'b1111;
        c_in = 0;
        #10;

        if ({c_out, sum} == 5'b11110)
            $display(" %b | %b |  %b   |   %b   | %b |  11110   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  11110   | FAIL",
                     a, b, c_in, c_out, sum);
            errors = errors + 1;
        end


        // Test carry-in: 5 + 6 + 1 = 12
        a = 4'b0101;
        b = 4'b0110;
        c_in = 1;
        #10;

        if ({c_out, sum} == 5'b01100)
            $display(" %b | %b |  %b   |   %b   | %b |  01100   | PASS",
                     a, b, c_in, c_out, sum);
        else begin
            $display(" %b | %b |  %b   |   %b   | %b |  01100   | FAIL",
                     a, b, c_in, c_out, sum);
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