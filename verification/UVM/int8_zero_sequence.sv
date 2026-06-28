`timescale 1ns/1ps
`ifndef INT8_ZERO_SEQUENCE_SV
`define INT8_ZERO_SEQUENCE_SV

class int8_zero_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_zero_sequence)

    function new(string name="int8_zero_sequence");
        super.new(name);
    endfunction

    task body();

        int8_seq_item req;

        req = int8_seq_item::type_id::create("req");

        start_item(req);

        req.a_left = '{0,0,0,0};
        req.w_top  = '{0,0,0,0};

        finish_item(req);

    endtask

endclass

`endif