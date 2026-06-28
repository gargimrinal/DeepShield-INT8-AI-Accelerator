`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 18:13:38
// Design Name: 
// Module Name: int8_regression_sequence
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
`timescale 1ns/1ps
`ifndef INT8_REGRESSION_SEQUENCE_SV
`define INT8_REGRESSION_SEQUENCE_SV

class int8_regression_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_regression_sequence)

    function new(string name = "int8_regression_sequence");
        super.new(name);
    endfunction

    task body();

        int8_positive_sequence pos_seq;
        int8_negative_sequence neg_seq;
        int8_zero_sequence     zero_seq;
        int8_max_sequence      max_seq;
        int8_min_sequence      min_seq;
        int8_mixed_sequence    mixed_seq;
        int8_sequence          rand_seq;

        //-------------------------------------------------
        // Positive
        //-------------------------------------------------
        pos_seq = int8_positive_sequence::type_id::create("pos_seq");
        pos_seq.start(m_sequencer);

        //-------------------------------------------------
        // Negative
        //-------------------------------------------------
        neg_seq = int8_negative_sequence::type_id::create("neg_seq");
        neg_seq.start(m_sequencer);

        //-------------------------------------------------
        // Zero
        //-------------------------------------------------
        zero_seq = int8_zero_sequence::type_id::create("zero_seq");
        zero_seq.start(m_sequencer);

        //-------------------------------------------------
        // Maximum values
        //-------------------------------------------------
        max_seq = int8_max_sequence::type_id::create("max_seq");
        max_seq.start(m_sequencer);

        //-------------------------------------------------
        // Minimum values
        //-------------------------------------------------
        min_seq = int8_min_sequence::type_id::create("min_seq");
        min_seq.start(m_sequencer);

        //-------------------------------------------------
        // Mixed values
        //-------------------------------------------------
        mixed_seq = int8_mixed_sequence::type_id::create("mixed_seq");
        mixed_seq.start(m_sequencer);

        //-------------------------------------------------
        // Random
        //-------------------------------------------------
        rand_seq = int8_sequence::type_id::create("rand_seq");
        rand_seq.start(m_sequencer);

    endtask

endclass

`endif
