`timescale 1ns / 1ps

module ram256x16_tb;

reg         clk;
reg         write_enable;
reg  [7:0]  addr;
reg  [15:0] data_in;
wire [15:0] data_out;

integer pass_count;
integer fail_count;


// DUT
ram256x16 dut (
    .clk(clk),
    .write_enable(write_enable),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);


// Clock
always #5 clk = ~clk;


// Write task
task write_ram;
    input [7:0] address;
    input [15:0] data;
begin
    addr = address;
    data_in = data;
    write_enable = 1'b1;

    // Wait for rising edge
    @(posedge clk);
    #2;

    write_enable = 1'b0;
end
endtask


// Read/check task
task check_ram;
    input [7:0] address;
    input [15:0] expected;
begin

    addr = address;
    write_enable = 1'b0;

    #10;

    if (data_out === expected) begin
        $display("PASS: addr=%h expected=%h got=%h",
                 address, expected, data_out);

        pass_count = pass_count + 1;
    end

    else begin
        $display("FAIL: addr=%h expected=%h got=%h",
                 address, expected, data_out);

        fail_count = fail_count + 1;
    end

end
endtask


initial begin

    clk = 0;
    write_enable = 0;
    addr = 0;
    data_in = 0;

    pass_count = 0;
    fail_count = 0;

    #20;


    // =====================================================
    // TEST 1
    // Write/read address 0
    // =====================================================

    write_ram(8'h00, 16'h1234);
    check_ram(8'h00, 16'h1234);


    // =====================================================
    // TEST 2
    // Write/read address 1
    // =====================================================

    write_ram(8'h01, 16'hABCD);
    check_ram(8'h01, 16'hABCD);


    // Make sure address 0 was not changed

    check_ram(8'h00, 16'h1234);


    // =====================================================
    // TEST 3
    // Middle address
    // =====================================================

    write_ram(8'h80, 16'h55AA);
    check_ram(8'h80, 16'h55AA);


    // =====================================================
    // TEST 4
    // Last address
    // =====================================================

    write_ram(8'hFF, 16'hF00D);
    check_ram(8'hFF, 16'hF00D);


    // =====================================================
    // TEST 5
    // Overwrite existing location
    // =====================================================

    write_ram(8'h01, 16'h9876);
    check_ram(8'h01, 16'h9876);


    // Other addresses should still be unchanged

    check_ram(8'h00, 16'h1234);
    check_ram(8'h80, 16'h55AA);
    check_ram(8'hFF, 16'hF00D);


    // =====================================================
    // TEST 6
    // Walking addresses
    // =====================================================

    write_ram(8'h10, 16'h1111);
    write_ram(8'h20, 16'h2222);
    write_ram(8'h30, 16'h3333);
    write_ram(8'h40, 16'h4444);

    check_ram(8'h10, 16'h1111);
    check_ram(8'h20, 16'h2222);
    check_ram(8'h30, 16'h3333);
    check_ram(8'h40, 16'h4444);


    // =====================================================
    // RESULTS
    // =====================================================

    $display("");
    $display("============================");
    $display("RAM TEST COMPLETE");
    $display("PASS = %0d", pass_count);
    $display("FAIL = %0d", fail_count);
    $display("============================");

    if (fail_count == 0)
        $display("ALL TESTS PASSED");
    else
        $display("RAM TEST FAILED");

    $finish;

end

endmodule