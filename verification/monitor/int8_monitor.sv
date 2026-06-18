`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 14:19:38
// Design Name: 
// Module Name: int8_monitor
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
class int8_monitor;

    localparam ROWS = 4;
    localparam COLS = 4;
    localparam ACC_WIDTH = 20;

    task sample(

        input logic done,
        input logic signed [ACC_WIDTH-1:0] y [ROWS-1:0][COLS-1:0]

    );

        integer i;
        integer j;

        $display("\n========== MONITOR ==========");
        $display("done = %0b", done);

        $display("Output Matrix:");

        for(i=0;i<ROWS;i++) begin

            for(j=0;j<COLS;j++)
                $write("%8d ", y[i][j]);

            $display("");

        end

        $display("=============================\n");

    endtask

endclass