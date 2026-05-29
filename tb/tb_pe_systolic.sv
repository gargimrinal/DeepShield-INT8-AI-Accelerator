`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 11:14:23
// Design Name: 
// Module Name: tb_pe_systolic
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
module tb_pe_systolic;
parameter data_width = 8;
parameter acc_width  = 2*data_width+4;
parameter ROWS = 2;
parameter COLS = 2;
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
) dut (.*);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
//initialization
    rst_n = 0;
    en    = 0;
    a_left[0] = 0;
    a_left[1] = 0;
    w_top[0]  = 0;
    w_top[1]  = 0;

// reset
    #10;
    rst_n = 1;
    en    = 1;


    // cycle 1
    #10;

    a_left[0] = 1;
    a_left[1] = 2;

    w_top[0]  = 3;
    w_top[1]  = 4;


    // cycle 2
    #10;

    a_left[0] = 5;
    a_left[1] = 6;

    w_top[0]  = 7;
    w_top[1]  = 8;


    // cycle 3
    #10;

    a_left[0] = -2;
    a_left[1] = 3;

    w_top[0]  = 2;
    w_top[1]  = -1;


    #50;
    $finish;

end
// monitor
initial begin

    $monitor(

        "TIME=%0t | y00=%0d y01=%0d y10=%0d y11=%0d",

        $time,

        y[0][0],
        y[0][1],
        y[1][0],
        y[1][1]
    );

end
endmodule
