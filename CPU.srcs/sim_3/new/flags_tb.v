`timescale 1ns / 1ps

module flags_tb;

    reg [7:0] a, b, y;
    reg [3:0] alu_op;

    reg add_out, sub_out, inc_out, dec_out;

    wire z, n, c, v;

    integer tests;
    integer errors;

    flags uut (
        .a(a),
        .b(b),
        .y(y),
        .alu_op(alu_op),

        .add_out(add_out),
        .sub_out(sub_out),
        .inc_out(inc_out),
        .dec_out(dec_out),

        .z(z),
        .n(n),
        .c(c),
        .v(v)
    );


    task check_flags;

        input exp_z;
        input exp_n;
        input exp_c;
        input exp_v;

        begin

            #1;
            tests = tests + 1;

            if ((z === exp_z) &&
                (n === exp_n) &&
                (c === exp_c) &&
                (v === exp_v)) begin

                $display("PASS | op=%b a=%b b=%b y=%b | Z=%b N=%b C=%b V=%b",
                         alu_op, a, b, y, z, n, c, v);

            end
            else begin

                errors = errors + 1;

                $display("FAIL | op=%b a=%b b=%b y=%b",
                         alu_op, a, b, y);

                $display("       Got:      Z=%b N=%b C=%b V=%b",
                         z, n, c, v);

                $display("       Expected: Z=%b N=%b C=%b V=%b",
                         exp_z, exp_n, exp_c, exp_v);

            end
        end

    endtask


    initial begin

        tests  = 0;
        errors = 0;

        a = 0;
        b = 0;
        y = 0;
        alu_op = 0;

        add_out = 0;
        sub_out = 0;
        inc_out = 0;
        dec_out = 0;

        #5;


        // =====================================================
        // ADD = 0000
        // =====================================================

        // 1 + 1 = 2
        // No carry, no overflow
        a = 8'b00000001;
        b = 8'b00000001;
        y = 8'b00000010;

        alu_op = 4'b0000;

        add_out = 0;
        sub_out = 0;
        inc_out = 0;
        dec_out = 0;

        check_flags(0, 0, 0, 0);


        // 127 + 1 = -128
        // Signed overflow
        a = 8'b01111111;
        b = 8'b00000001;
        y = 8'b10000000;

        alu_op = 4'b0000;

        add_out = 0;

        check_flags(0, 1, 0, 1);


        // -1 + 1 = 0
        // Unsigned carry-out = 1
        a = 8'b11111111;
        b = 8'b00000001;
        y = 8'b00000000;

        alu_op = 4'b0000;

        add_out = 1;

        check_flags(1, 0, 1, 0);


        // =====================================================
        // SUB = 0001
        // =====================================================

        // 5 - 3 = 2
        a = 8'b00000101;
        b = 8'b00000011;
        y = 8'b00000010;

        alu_op = 4'b0001;

        add_out = 0;
        sub_out = 0;
        inc_out = 0;
        dec_out = 0;

        check_flags(0, 0, 0, 0);


        // 127 - (-1) = -128
        // Signed overflow
        //
        // Raw unsigned borrow:
        // 01111111 < 11111111 => borrow = 1
        a = 8'b01111111;
        b = 8'b11111111;
        y = 8'b10000000;

        alu_op = 4'b0001;

        sub_out = 1;

        check_flags(0, 1, 1, 1);


        // -128 - 1 = 127
        // Signed overflow
        a = 8'b10000000;
        b = 8'b00000001;
        y = 8'b01111111;

        alu_op = 4'b0001;

        sub_out = 0;

        check_flags(0, 0, 0, 1);


        // =====================================================
        // INC = 1011
        // =====================================================

        // 5 + 1 = 6
        a = 8'b00000101;
        b = 8'b00000000;
        y = 8'b00000110;

        alu_op = 4'b1011;

        add_out = 0;
        sub_out = 0;
        inc_out = 0;
        dec_out = 0;

        check_flags(0, 0, 0, 0);


        // 127 + 1 = -128
        // Signed overflow
        a = 8'b01111111;
        b = 8'b00000000;
        y = 8'b10000000;

        alu_op = 4'b1011;

        inc_out = 0;

        check_flags(0, 1, 0, 1);


        // 255 + 1 = 0
        // Carry-out = 1
        a = 8'b11111111;
        b = 8'b00000000;
        y = 8'b00000000;

        alu_op = 4'b1011;

        inc_out = 1;

        check_flags(1, 0, 1, 0);


        // =====================================================
        // DEC = 1100
        // =====================================================

        // 5 - 1 = 4
        a = 8'b00000101;
        b = 8'b00000000;
        y = 8'b00000100;

        alu_op = 4'b1100;

        add_out = 0;
        sub_out = 0;
        inc_out = 0;
        dec_out = 0;

        check_flags(0, 0, 0, 0);


        // -128 - 1 = 127
        // Signed overflow
        a = 8'b10000000;
        b = 8'b00000000;
        y = 8'b01111111;

        alu_op = 4'b1100;

        dec_out = 0;

        check_flags(0, 0, 0, 1);


        // 0 - 1 = -1
        // Borrow-out = 1
        a = 8'b00000000;
        b = 8'b00000000;
        y = 8'b11111111;

        alu_op = 4'b1100;

        dec_out = 1;

        check_flags(0, 1, 1, 0);


        // =====================================================
        // NON-ARITHMETIC OPERATION
        // Example: AND = 0010
        //
        // C and V should be zero even if all arithmetic
        // carry signals happen to be high.
        // =====================================================

        a = 8'b10101010;
        b = 8'b01010101;
        y = 8'b00000000;

        alu_op = 4'b0010;

        add_out = 1;
        sub_out = 1;
        inc_out = 1;
        dec_out = 1;

        check_flags(1, 0, 0, 0);


        // Non-arithmetic result with MSB = 1
        // Tests negative flag
        a = 8'b11110000;
        b = 8'b11111111;
        y = 8'b11110000;

        alu_op = 4'b0010;

        check_flags(0, 1, 0, 0);


        // =====================================================
        // RESULTS
        // =====================================================

        $display("");
        $display("========================================");

        if (errors == 0)
            $display("ALL TESTS PASSED (%0d/%0d)", tests, tests);
        else
            $display("TESTS FAILED: %0d passed, %0d failed",
                     tests - errors, errors);

        $display("========================================");

        $finish;

    end

endmodule