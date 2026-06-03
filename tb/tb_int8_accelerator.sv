`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 09:53:00
// Design Name: 
// Module Name: tb_int8_accelerator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_int8_accelerator;

parameter data_width = 8;
parameter acc_width  = 2*data_width+4;
parameter ROWS = 4;
parameter COLS = 4;

logic clk;
logic rst_n;
logic start;

logic signed [data_width-1:0] a_left [ROWS-1:0];
logic signed [data_width-1:0] w_top  [COLS-1:0];

logic done;
logic signed [acc_width-1:0] y [ROWS-1:0][COLS-1:0];

int8_accelerator #(
    .data_width(data_width),
    .acc_width(acc_width),
    .ROWS(ROWS),
    .COLS(COLS)
) dut (
    .clk(clk),
    .rst_n(rst_n),
    .start(start),
    .a_left(a_left),
    .w_top(w_top),
    .done(done),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    rst_n = 0;
    start = 0;

    a_left[0] = 0;
    a_left[1] = 0;
    a_left[2] = 0;
    a_left[3] = 0;

    w_top[0] = 0;
    w_top[1] = 0;
    w_top[2] = 0;
    w_top[3] = 0;

    #10;
    rst_n = 1;

    #10;

    a_left[0] = 1;
    a_left[1] = 2;
    a_left[2] = 3;
    a_left[3] = 4;

    w_top[0] = 5;
    w_top[1] = 6;
    w_top[2] = 7;
    w_top[3] = 8;

    start = 1;

    #10;
    start = 0;

    #80;

    a_left[0] = -1;
    a_left[1] = -2;
    a_left[2] = 3;
    a_left[3] = 4;

    w_top[0] = 2;
    w_top[1] = -3;
    w_top[2] = 4;
    w_top[3] = -5;

    start = 1;

    #10;
    start = 0;

    #80;

    $finish;

end

initial begin
    $monitor(
        "T=%0t start=%0b done=%0b y00=%0d y01=%0d y10=%0d y11=%0d",
        $time,
        start,
        done,
        y[0][0],
        y[0][1],
        y[1][0],
        y[1][1]
    );
end

endmodule
