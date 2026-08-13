`timescale 1ns / 1ps

module mux2to1_nand_tb;

    reg i0, i1, s;
    wire y;

    integer errors;

    // Instantiate DUT
    mux2to1_nand dut (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    initial begin

        errors = 0;

        $display("-------------------------------------");
        $display(" s | i0 | i1 | y | Expected | Result");
        $display("-------------------------------------");

        // s = 0, i0 = 0, i1 = don't care
        s = 0; i0 = 0; i1 = 0;
        #10;

        if (y == 0)
            $display(" %b |  %b |  x | %b |    0     | PASS",
                     s, i0, y);
        else begin
            $display(" %b |  %b |  x | %b |    0     | FAIL",
                     s, i0, y);
            errors = errors + 1;
        end


        // s = 0, i0 = 1, i1 = don't care
        s = 0; i0 = 1; i1 = 0;
        #10;

        if (y == 1)
            $display(" %b |  %b |  x | %b |    1     | PASS",
                     s, i0, y);
        else begin
            $display(" %b |  %b |  x | %b |    1     | FAIL",
                     s, i0, y);
            errors = errors + 1;
        end


        // s = 1, i0 = don't care, i1 = 0
        s = 1; i0 = 0; i1 = 0;
        #10;

        if (y == 0)
            $display(" %b |  x |  %b | %b |    0     | PASS",
                     s, i1, y);
        else begin
            $display(" %b |  x |  %b | %b |    0     | FAIL",
                     s, i1, y);
            errors = errors + 1;
        end


        // s = 1, i0 = don't care, i1 = 1
        s = 1; i0 = 0; i1 = 1;
        #10;

        if (y == 1)
            $display(" %b |  x |  %b | %b |    1     | PASS",
                     s, i1, y);
        else begin
            $display(" %b |  x |  %b | %b |    1     | FAIL",
                     s, i1, y);
            errors = errors + 1;
        end


        $display("-------------------------------------");

        if (errors == 0)
            $display("SUCCESS: All test cases passed!");
        else
            $display("FAILURE: %0d test case(s) failed.", errors);

        $display("-------------------------------------");

        $finish;

    end

endmodule