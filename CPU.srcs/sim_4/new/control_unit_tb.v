`timescale 1ns / 1ps

module control_unit_tb;

reg  [3:0] opcode;
reg        z_flag;
reg        c_flag;

wire       reg_write;
wire       mem_write;
wire       pc_load;
wire       pc_inc;
wire       halt;
wire [3:0] alu_op;
wire [1:0] writeback_sel;

integer pass_count;
integer fail_count;


// DUT
control_unit dut (
    .opcode(opcode),
    .z_flag(z_flag),
    .c_flag(c_flag),
    .reg_write(reg_write),
    .mem_write(mem_write),
    .pc_load(pc_load),
    .pc_inc(pc_inc),
    .halt(halt),
    .alu_op(alu_op),
    .writeback_sel(writeback_sel)
);


// check task
task check_control;
    input [3:0] op;
    input       z;
    input       c;

    input       exp_reg_write;
    input       exp_mem_write;
    input       exp_pc_load;
    input       exp_pc_inc;
    input       exp_halt;

    input [3:0] exp_alu_op;
    input [1:0] exp_writeback;

begin

    opcode = op;
    z_flag = z;
    c_flag = c;

    #10;

    if (
        reg_write     === exp_reg_write &&
        mem_write     === exp_mem_write &&
        pc_load       === exp_pc_load &&
        pc_inc        === exp_pc_inc &&
        halt          === exp_halt &&
        alu_op         === exp_alu_op &&
        writeback_sel === exp_writeback
    ) begin

        $display(
            "PASS opcode=%b | reg=%b mem=%b load=%b inc=%b halt=%b alu=%b wb=%b",
            opcode,
            reg_write,
            mem_write,
            pc_load,
            pc_inc,
            halt,
            alu_op,
            writeback_sel
        );

        pass_count = pass_count + 1;

    end

    else begin

        $display("FAIL opcode=%b", opcode);

        $display(
            " expected: reg=%b mem=%b load=%b inc=%b halt=%b alu=%b wb=%b",
            exp_reg_write,
            exp_mem_write,
            exp_pc_load,
            exp_pc_inc,
            exp_halt,
            exp_alu_op,
            exp_writeback
        );

        $display(
            "      got: reg=%b mem=%b load=%b inc=%b halt=%b alu=%b wb=%b",
            reg_write,
            mem_write,
            pc_load,
            pc_inc,
            halt,
            alu_op,
            writeback_sel
        );

        fail_count = fail_count + 1;

    end

end
endtask


initial begin

    opcode = 4'b0000;
    z_flag = 0;
    c_flag = 0;

    pass_count = 0;
    fail_count = 0;

    #10;


    // =====================================================
    // 0000 NOP
    // =====================================================

    check_control(
        4'b0000,
        0, 0,
        0, 0, 0, 1, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 0001 ADD
    // =====================================================

    check_control(
        4'b0001,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 0010 SUB
    // =====================================================

    check_control(
        4'b0010,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0001,
        2'b00
    );


    // =====================================================
    // 0011 AND
    // =====================================================

    check_control(
        4'b0011,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0010,
        2'b00
    );


    // =====================================================
    // 0100 OR
    // =====================================================

    check_control(
        4'b0100,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0011,
        2'b00
    );


    // =====================================================
    // 0101 XOR
    // =====================================================

    check_control(
        4'b0101,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0100,
        2'b00
    );


    // =====================================================
    // 0110 NOT
    // =====================================================

    check_control(
        4'b0110,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0101,
        2'b00
    );


    // =====================================================
    // 0111 SHL
    // =====================================================

    check_control(
        4'b0111,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0110,
        2'b00
    );


    // =====================================================
    // 1000 SHR
    // =====================================================

    check_control(
        4'b1000,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0111,
        2'b00
    );


    // =====================================================
    // 1001 LDI
    // =====================================================

    check_control(
        4'b1001,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0000,
        2'b01
    );


    // =====================================================
    // 1010 LD
    // =====================================================

    check_control(
        4'b1010,
        0, 0,
        1, 0, 0, 1, 0,
        4'b0000,
        2'b10
    );


    // =====================================================
    // 1011 STR
    // =====================================================

    check_control(
        4'b1011,
        0, 0,
        0, 1, 0, 1, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1100 JMP
    // =====================================================

    check_control(
        4'b1100,
        0, 0,
        0, 0, 1, 0, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1101 JZ - not taken
    // =====================================================

    check_control(
        4'b1101,
        0, 0,
        0, 0, 0, 1, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1101 JZ - taken
    // =====================================================

    check_control(
        4'b1101,
        1, 0,
        0, 0, 1, 0, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1110 JC - not taken
    // =====================================================

    check_control(
        4'b1110,
        0, 0,
        0, 0, 0, 1, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1110 JC - taken
    // =====================================================

    check_control(
        4'b1110,
        0, 1,
        0, 0, 1, 0, 0,
        4'b0000,
        2'b00
    );


    // =====================================================
    // 1111 HALT
    // =====================================================

    check_control(
        4'b1111,
        0, 0,
        0, 0, 0, 0, 1,
        4'b0000,
        2'b00
    );


    // =====================================================
    // RESULTS
    // =====================================================

    $display("");
    $display("==============================");
    $display("CONTROL UNIT TEST COMPLETE");
    $display("PASS = %0d", pass_count);
    $display("FAIL = %0d", fail_count);
    $display("==============================");

    if (fail_count == 0)
        $display("ALL TESTS PASSED");
    else
        $display("SOME TESTS FAILED");

    $finish;

end

endmodule