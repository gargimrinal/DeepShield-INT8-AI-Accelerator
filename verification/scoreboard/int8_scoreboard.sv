`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 13:37:42
// Design Name: 
// Module Name: int8_scoreboard
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
class int8_scoreboard;

    localparam ROWS = 4;
    localparam COLS = 4;
    localparam ACC_WIDTH = 20;

    integer pass_count = 0;
    integer fail_count = 0;

    task check(
        input logic signed [ACC_WIDTH-1:0] expected [ROWS-1:0][COLS-1:0],
        input logic signed [ACC_WIDTH-1:0] actual   [ROWS-1:0][COLS-1:0]
    );

        integer i, j;

        for (i = 0; i < ROWS; i++) begin
            for (j = 0; j < COLS; j++) begin

                if (expected[i][j] !== actual[i][j]) begin
                    fail_count++;

                    $display("FAIL : y[%0d][%0d] Expected=%0d Actual=%0d",
                              i, j,
                              expected[i][j],
                              actual[i][j]);
                end
                else begin
                    pass_count++;

                    $display("PASS : y[%0d][%0d] = %0d",
                              i, j,
                              actual[i][j]);
                end

            end
        end

    endtask

endclass