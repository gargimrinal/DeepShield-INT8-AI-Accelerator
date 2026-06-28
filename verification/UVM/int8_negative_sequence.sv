`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 17:51:25
// Design Name: 
// Module Name: int8_negative_sequence
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
`ifndef INT8_NEGATIVE_SEQUENCE_SV
`define INT8_NEGATIVE_SEQUENCE_SV

class int8_negative_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_negative_sequence)

    function new(string name="int8_negative_sequence");
        super.new(name);
    endfunction

    task body();

        int8_seq_item req;

        req = int8_seq_item::type_id::create("req");

        start_item(req);

        req.a_left = '{-10,-20,-30,-40};
        req.w_top  = '{-5,-6,-7,-8};

        finish_item(req);

    endtask

endclass

`endif
