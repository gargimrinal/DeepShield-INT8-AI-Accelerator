`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/// Top-level INT8 AI accelerator
//
// Components:
// 1. FSM Controller
// 2. 4x4 Systolic MAC Array
// 3. Saturating Processing Elements
//
// Operation:
// start -> LOAD -> COMPUTE -> DONE
//
// Author: Gargi Mrinal
// 
//////////////////////////////////////////////////////////////////////////////////
module int8_accelerator #(
    parameter data_width = 8,
    parameter acc_width  = 2*data_width+4,
    parameter ROWS = 4,
    parameter COLS = 4
)(
    input logic clk,
    input logic rst_n,
    input logic start,

    input logic signed [data_width-1:0] a_left [ROWS-1:0],
    input logic signed [data_width-1:0] w_top  [COLS-1:0],

    output logic done,
    output logic signed [acc_width-1:0] y [ROWS-1:0][COLS-1:0]
);

logic en;

fsm u_fsm (
    .clk(clk),
    .rst_n(rst_n),
    .start(start),
    .en(en),
    .done(done)
);

pe_systolic #(
    .data_width(data_width),
    .acc_width(acc_width),
    .ROWS(ROWS),
    .COLS(COLS)
) u_array (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .a_left(a_left),
    .w_top(w_top),
    .y(y)
);

endmodule
