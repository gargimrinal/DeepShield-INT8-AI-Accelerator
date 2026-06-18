`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 17:03:15
// Design Name: 
// Module Name: int8_transaction
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
class int8_transaction;

    localparam DATA_WIDTH = 8;
    localparam ROWS = 4;
    localparam COLS = 4;
rand logic signed [DATA_WIDTH-1:0] a_left [ROWS-1:0];
rand logic signed [DATA_WIDTH-1:0] w_top  [COLS-1:0];

constraint valid_range {
foreach(a_left[i])
    a_left[i] dist {
        -20 := 1,
        [-19:-1] := 4,
        0 := 2,
        [1:19] := 4,
        20 := 1
    };

foreach(w_top[i])
    w_top[i] dist {
        -20 := 1,
        [-19:-1] := 4,
        0 := 2,
        [1:19] := 4,
        20 := 1
    };
}

task display();

    integer i;

    $display("\n RANDOM TRANSACTION ");

    $write("a_left : ");

    for(i=0; i<ROWS; i++)
        $write("%4d ", a_left[i]);

    $display("");

    $write("w_top  : ");

    for(i=0; i<COLS; i++)
        $write("%4d ", w_top[i]);

    $display("");

    $display("\n");

endtask
endclass