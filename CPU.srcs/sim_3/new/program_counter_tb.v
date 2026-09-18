`timescale 1ns / 1ps

module program_counter_tb;

    reg        clk;
    reg        load;
    reg        inc;
    reg        reset;
    reg  [7:0] data_in;

    wire [7:0] pc;

    integer tests;
    integer errors;

    program_counter uut (
        .clk(clk),
        .load(load),
        .inc(inc),
        .reset(reset),
        .data_in(data_in),
        .pc(pc)
    );

    // 10 ns clock period
    always #5 clk = ~clk;


    task check_pc;
        input [7:0] expected;

        begin
            #1;
            tests = tests + 1;

            if (pc === expected) begin
                $display("PASS | pc=%b expected=%b | reset=%b load=%b inc=%b data_in=%b",
                         pc, expected, reset, load, inc, data_in);
            end
            else begin
                errors = errors + 1;

                $display("FAIL | pc=%b expected=%b | reset=%b load=%b inc=%b data_in=%b",
                         pc, expected, reset, load, inc, data_in);
            end
        end
    endtask


    initial begin

        clk     = 0;
        load    = 0;
        inc     = 0;
        reset   = 0;
        data_in = 8'h00;

        tests  = 0;
        errors = 0;


        // =====================================================
        // RESET
        // =====================================================

        reset = 1;
        load  = 0;
        inc   = 0;

        @(posedge clk);
        #1;

        check_pc(8'h00);


        // =====================================================
        // HOLD
        // =====================================================

        reset = 0;
        load  = 0;
        inc   = 0;

        @(posedge clk);
        #1;

        check_pc(8'h00);


        // =====================================================
        // INCREMENT
        // =====================================================

        inc = 1;

        @(posedge clk);
        #1;
        check_pc(8'h01);

        @(posedge clk);
        #1;
        check_pc(8'h02);

        @(posedge clk);
        #1;
        check_pc(8'h03);


        // =====================================================
        // HOLD AFTER INCREMENT
        // =====================================================

        inc = 0;

        @(posedge clk);
        #1;

        check_pc(8'h03);


        // =====================================================
        // LOAD
        // =====================================================

        load    = 1;
        data_in = 8'hA5;

        @(posedge clk);
        #1;

        check_pc(8'hA5);


        // =====================================================
        // HOLD LOADED VALUE
        // =====================================================

        load = 0;

        @(posedge clk);
        #1;

        check_pc(8'hA5);


        // =====================================================
        // INCREMENT LOADED VALUE
        // =====================================================

        inc = 1;

        @(posedge clk);
        #1;

        check_pc(8'hA6);


        // =====================================================
        // LOAD SHOULD OVERRIDE INC
        // =====================================================

        load    = 1;
        inc     = 1;
        data_in = 8'h40;

        @(posedge clk);
        #1;

        check_pc(8'h40);


        // =====================================================
        // RESET SHOULD OVERRIDE LOAD AND INC
        // =====================================================

        reset   = 1;
        load    = 1;
        inc     = 1;
        data_in = 8'hFF;

        @(posedge clk);
        #1;

        check_pc(8'h00);


        // =====================================================
        // CHECK WRAPAROUND
        // =====================================================

        reset   = 0;
        load    = 1;
        inc     = 0;
        data_in = 8'hFF;

        @(posedge clk);
        #1;

        check_pc(8'hFF);


        load = 0;
        inc  = 1;

        @(posedge clk);
        #1;

        check_pc(8'h00);


        // =====================================================
        // FINAL SUMMARY
        // =====================================================

        $display("");
        $display("========================================");

        if (errors == 0)
            $display("ALL TESTS PASSED: %0d/%0d", tests, tests);
        else
            $display("TESTS FAILED: %0d passed, %0d failed",
                     tests - errors, errors);

        $display("========================================");

        $finish;

    end

endmodule