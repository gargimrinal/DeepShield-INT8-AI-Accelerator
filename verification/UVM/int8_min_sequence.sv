`timescale 1ns / 1ps
`ifndef INT8_MIN_SEQUENCE_SV
`define INT8_MIN_SEQUENCE_SV

class int8_min_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_min_sequence)

    function new(string name="int8_min_sequence");
        super.new(name);
    endfunction

    task body();

        int8_seq_item req;

        req = int8_seq_item::type_id::create("req");

        start_item(req);

        req.a_left = '{-128,-128,-128,-128};
        req.w_top  = '{-128,-128,-128,-128};

        finish_item(req);

    endtask

endclass

`endif