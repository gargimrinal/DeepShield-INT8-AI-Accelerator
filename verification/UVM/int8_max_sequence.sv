`timescale 1ns / 1ps
`ifndef INT8_MAX_SEQUENCE_SV
`define INT8_MAX_SEQUENCE_SV

class int8_max_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_max_sequence)

    function new(string name="int8_max_sequence");
        super.new(name);
    endfunction

    task body();

        int8_seq_item req;

        req = int8_seq_item::type_id::create("req");

        start_item(req);

        req.a_left = '{127,127,127,127};
        req.w_top  = '{127,127,127,127};

        finish_item(req);

    endtask

endclass

`endif