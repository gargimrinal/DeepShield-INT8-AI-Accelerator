`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 15:29:10
// Design Name: 
// Module Name: int8_sequencer
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
`ifndef INT8_SEQUENCER_SV
`define INT8_SEQUENCER_SV

class int8_sequencer extends uvm_sequencer #(int8_seq_item);

    `uvm_component_utils(int8_sequencer)

    function new(string name = "int8_sequencer",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction

endclass

`endif
