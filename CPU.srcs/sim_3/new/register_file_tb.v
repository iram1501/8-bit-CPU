`timescale 1ns / 1ps

module register_file_tb;

    reg        clk;
    reg        write_enable;
    reg  [2:0] write_addr;
    reg  [2:0] read_addr_a;
    reg  [2:0] read_addr_b;
    reg  [7:0] write_data;

    wire [7:0] read_data_a;
    wire [7:0] read_data_b;

    integer tests;
    integer errors;

    register_file uut (
        .clk(clk),
        .write_enable(write_enable),
        .write_addr(write_addr),
        .read_addr_a(read_addr_a),
        .read_addr_b(read_addr_b),
        .write_data(write_data),
        .read_data_a(read_data_a),
        .read_data_b(read_data_b)
    );

    // clock: 10 ns period
    always #5 clk = ~clk;


    task write_reg;
        input [2:0] addr;
        input [7:0] data;

        begin
            write_addr   = addr;
            write_data   = data;
            write_enable = 1;

            // wait for rising edge
            @(posedge clk);
            #1;

            write_enable = 0;
        end
    endtask


    task check_a;
        input [2:0] addr;
        input [7:0] expected;

        begin
            read_addr_a = addr;
            #2;

            tests = tests + 1;

            if (read_data_a === expected) begin
                $display("PASS A | R%0d = %b", addr, read_data_a);
            end
            else begin
                errors = errors + 1;

                $display("FAIL A | R%0d", addr);
                $display("         Got:      %b", read_data_a);
                $display("         Expected: %b", expected);
            end
        end
    endtask


    task check_b;
        input [2:0] addr;
        input [7:0] expected;

        begin
            read_addr_b = addr;
            #2;

            tests = tests + 1;

            if (read_data_b === expected) begin
                $display("PASS B | R%0d = %b", addr, read_data_b);
            end
            else begin
                errors = errors + 1;

                $display("FAIL B | R%0d", addr);
                $display("         Got:      %b", read_data_b);
                $display("         Expected: %b", expected);
            end
        end
    endtask


    task check_both;
        input [2:0] addr_a;
        input [7:0] expected_a;

        input [2:0] addr_b;
        input [7:0] expected_b;

        begin
            read_addr_a = addr_a;
            read_addr_b = addr_b;

            #2;

            tests = tests + 1;

            if ((read_data_a === expected_a) &&
                (read_data_b === expected_b)) begin

                $display("PASS BOTH | A:R%0d=%b | B:R%0d=%b",
                         addr_a, read_data_a,
                         addr_b, read_data_b);

            end
            else begin

                errors = errors + 1;

                $display("FAIL BOTH");

                $display("A: R%0d got=%b expected=%b",
                         addr_a, read_data_a, expected_a);

                $display("B: R%0d got=%b expected=%b",
                         addr_b, read_data_b, expected_b);
            end
        end
    endtask


    initial begin

        clk          = 0;
        write_enable = 0;
        write_addr   = 0;
        write_data   = 0;

        read_addr_a  = 0;
        read_addr_b  = 0;

        tests  = 0;
        errors = 0;

        #10;


        // =====================================================
        // WRITE VALUES TO ALL 8 REGISTERS
        // =====================================================

        write_reg(3'b000, 8'h11);   // R0
        write_reg(3'b001, 8'h22);   // R1
        write_reg(3'b010, 8'h33);   // R2
        write_reg(3'b011, 8'h44);   // R3
        write_reg(3'b100, 8'h55);   // R4
        write_reg(3'b101, 8'h66);   // R5
        write_reg(3'b110, 8'h77);   // R6
        write_reg(3'b111, 8'h88);   // R7


        // =====================================================
        // READ EACH REGISTER THROUGH PORT A
        // =====================================================

        check_a(3'b000, 8'h11);
        check_a(3'b001, 8'h22);
        check_a(3'b010, 8'h33);
        check_a(3'b011, 8'h44);
        check_a(3'b100, 8'h55);
        check_a(3'b101, 8'h66);
        check_a(3'b110, 8'h77);
        check_a(3'b111, 8'h88);


        // =====================================================
        // READ EACH REGISTER THROUGH PORT B
        // =====================================================

        check_b(3'b000, 8'h11);
        check_b(3'b001, 8'h22);
        check_b(3'b010, 8'h33);
        check_b(3'b011, 8'h44);
        check_b(3'b100, 8'h55);
        check_b(3'b101, 8'h66);
        check_b(3'b110, 8'h77);
        check_b(3'b111, 8'h88);


        // =====================================================
        // TEST BOTH READ PORTS AT THE SAME TIME
        // =====================================================

        check_both(
            3'b001, 8'h22,
            3'b110, 8'h77
        );

        check_both(
            3'b111, 8'h88,
            3'b011, 8'h44
        );


        // =====================================================
        // TEST OVERWRITING A REGISTER
        // =====================================================

        write_reg(3'b011, 8'hAB);

        check_a(3'b011, 8'hAB);

        // Make sure neighboring register was not changed
        check_b(3'b010, 8'h33);


        // =====================================================
        // TEST WRITE ENABLE = 0
        // R5 currently contains 66.
        // Try writing FF while write_enable is disabled.
        // =====================================================

        write_addr   = 3'b101;
        write_data   = 8'hFF;
        write_enable = 0;

        @(posedge clk);
        #1;

        check_a(3'b101, 8'h66);


        // =====================================================
        // TEST READING SAME REGISTER ON BOTH PORTS
        // =====================================================

        check_both(
            3'b100, 8'h55,
            3'b100, 8'h55
        );


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