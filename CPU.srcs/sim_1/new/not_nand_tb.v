`timescale 1ns / 1ps

module not_nand_tb;

    reg a;
    wire not_a;

    // Instantiate DUT
    not_nand dut (
        .a(a),
        .not_a(not_a)
    );

    initial begin

        $display("-----------------");
        $display(" a | not_a");
        $display("-----------------");

        // Truth table row 1
        a = 0;
        #10;
        $display(" %b |   %b", a, not_a);

        // Truth table row 2
        a = 1;
        #10;
        $display(" %b |   %b", a, not_a);

        $display("-----------------");

        $finish;
    end
endmodule
