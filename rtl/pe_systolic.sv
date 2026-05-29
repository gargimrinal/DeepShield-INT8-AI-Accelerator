`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 11:03:13
// Design Name: 
// Module Name: pe_systolic
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
module pe_systolic #(
    parameter data_width = 8,
    parameter acc_width  = 2*data_width+4,
    parameter ROWS = 2,
    parameter COLS = 2
)(

    input logic clk,
    input logic rst_n,
    input logic en,

    // left-side activation inputs
    input logic signed [data_width-1:0] a_left [ROWS-1:0],

    // top-side weight inputs
    input logic signed [data_width-1:0] w_top [COLS-1:0],

    // outputs
    output logic signed [acc_width-1:0] y [ROWS-1:0][COLS-1:0]
);


// internal systolic buses

logic signed [data_width-1:0] a_bus [ROWS-1:0][COLS:0];

logic signed [data_width-1:0] w_bus [ROWS:0][COLS-1:0];


// inject left activations
genvar r,c;

generate

    for(r = 0; r < ROWS; r++) begin

        assign a_bus[r][0] = a_left[r];

    end

endgenerate


// inject top weights
generate

    for(c = 0; c < COLS; c++) begin

        assign w_bus[0][c] = w_top[c];

    end

endgenerate
// PE grid
generate

    for(r = 0; r < ROWS; r++) begin : ROW_GEN

        for(c = 0; c < COLS; c++) begin : COL_GEN

            pe #(
                .data_width(data_width),
                .acc_width(acc_width)
            ) PE (

                .clk(clk),
                .rst_n(rst_n),
                .en(en),

                .a_in(a_bus[r][c]),
                .w_in(w_bus[r][c]),

                .psum_in('0),

                .a_out(a_bus[r][c+1]),
                .w_out(w_bus[r+1][c]),

                .psum_out(y[r][c])
            );
        end
     end
endgenerate
endmodule

