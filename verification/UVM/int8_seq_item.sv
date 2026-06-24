`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 15:16:02
// Design Name: 
// Module Name: int8_seq_item
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
// //////////////////////////////
`ifndef INT8_SEQ_ITEM_SV
`define INT8_SEQ_ITEM_SV

class int8_seq_item extends uvm_sequence_item;

    localparam DATA_WIDTH = 8;
    localparam ROWS = 4;
    localparam COLS = 4;

    rand logic signed [DATA_WIDTH-1:0] a_left [ROWS];
    rand logic signed [DATA_WIDTH-1:0] w_top  [COLS];
logic signed [19:0] y [ROWS][COLS];
    `uvm_object_utils_begin(int8_seq_item)
        `uvm_field_sarray_int(a_left, UVM_ALL_ON)
        `uvm_field_sarray_int(w_top,  UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "int8_seq_item");
        super.new(name);
    endfunction

endclass

`endif