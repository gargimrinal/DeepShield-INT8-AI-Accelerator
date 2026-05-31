`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 08:36:36
// Design Name: 
// Module Name: tb_pe_systolic_4x4
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
module tb_pe_systolic_4x4;

parameter data_width = 8;
parameter acc_width  = 2*data_width + 4;
parameter ROWS = 4;
parameter COLS = 4;

logic clk;
logic rst_n;
logic en;

// inputs
logic signed [data_width-1:0] a_left [ROWS-1:0];
logic signed [data_width-1:0] w_top  [COLS-1:0];

// outputs
logic signed [acc_width-1:0] y [ROWS-1:0][COLS-1:0];

pe_systolic #(
    .data_width(data_width),
    .acc_width(acc_width),
    .ROWS(ROWS),
    .COLS(COLS)
) dut (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .a_left(a_left),
    .w_top(w_top),
    .y(y)
);

/////////////////////////////////////////////////
// Clock
/////////////////////////////////////////////////

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

/////////////////////////////////////////////////
// Stimulus
/////////////////////////////////////////////////

initial begin

    rst_n = 0;
    en    = 0;

    a_left[0] = 0;
    a_left[1] = 0;
    a_left[2] = 0;
    a_left[3] = 0;

    w_top[0] = 0;
    w_top[1] = 0;
    w_top[2] = 0;
    w_top[3] = 0;

    // Reset
    #10;
    rst_n = 1;
    en    = 1;

    /////////////////////////////////////////////
    // Test 1
    /////////////////////////////////////////////

    #40;

    a_left[0] = 1;
    a_left[1] = 2;
    a_left[2] = 3;
    a_left[3] = 4;

    w_top[0] = 5;
    w_top[1] = 6;
    w_top[2] = 7;
    w_top[3] = 8;

    /////////////////////////////////////////////
    // Test 2
    /////////////////////////////////////////////

    #40;

    a_left[0] = 2;
    a_left[1] = 4;
    a_left[2] = 6;
    a_left[3] = 8;

    w_top[0] = 1;
    w_top[1] = 2;
    w_top[2] = 3;
    w_top[3] = 4;

    /////////////////////////////////////////////
    // Test 3
    /////////////////////////////////////////////

    #40;

    a_left[0] = -1;
    a_left[1] = -2;
    a_left[2] = 3;
    a_left[3] = 4;

    w_top[0] = 2;
    w_top[1] = -3;
    w_top[2] = 4;
    w_top[3] = -5;

    #80;

    $finish;

end

/////////////////////////////////////////////////
// Monitor
/////////////////////////////////////////////////

initial begin

    $monitor(
        "T=%0t | y00=%0d y01=%0d y02=%0d y03=%0d | y10=%0d y11=%0d y12=%0d y13=%0d",
        $time,
        y[0][0], y[0][1], y[0][2], y[0][3],
        y[1][0], y[1][1], y[1][2], y[1][3]
    );

end

endmodule
