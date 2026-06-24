`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 14:48:31
// Design Name: 
// Module Name: int8_if
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
interface int8_if;

    parameter DATA_WIDTH = 8;
    parameter ACC_WIDTH  = 20;
    parameter ROWS = 4;
    parameter COLS = 4;

    logic clk;
    logic rst_n;
    logic start;

    logic signed [DATA_WIDTH-1:0] a_left [ROWS-1:0];
    logic signed [DATA_WIDTH-1:0] w_top  [COLS-1:0];

    logic done;
    logic signed [ACC_WIDTH-1:0] y [ROWS-1:0][COLS-1:0];

endinterface