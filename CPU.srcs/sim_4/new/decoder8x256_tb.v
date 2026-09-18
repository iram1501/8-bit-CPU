`timescale 1ns / 1ps

module decoder8x256_tb;

reg [7:0] s;
wire [255:0] y;

decoder8x256 dut (
    .s(s),
    .y(y)
);

initial begin

    s = 8'h00;
    #10;
    $display("ADDR 00: y0=%b y1=%b y2=%b", y[0], y[1], y[2]);

    s = 8'h01;
    #10;
    $display("ADDR 01: y0=%b y1=%b y2=%b", y[0], y[1], y[2]);

    s = 8'h02;
    #10;
    $display("ADDR 02: y0=%b y1=%b y2=%b", y[0], y[1], y[2]);

    s = 8'h03;
    #10;
    $display("ADDR 03: y0=%b y1=%b y2=%b y3=%b",
             y[0], y[1], y[2], y[3]);

    $finish;

end

endmodule