`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 18:13:51
// Design Name: 
// Module Name: int8_sequence
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
`ifndef INT8_SEQUENCE_SV
`define INT8_SEQUENCE_SV

class int8_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_sequence)

    function new(string name = "int8_sequence");
        super.new(name);
    endfunction

    virtual task body();

        int8_seq_item req;

        repeat (20) begin

            req = int8_seq_item::type_id::create("req");

            start_item(req);

            assert(req.randomize());

            finish_item(req);

        end

    endtask

endclass

`endif
