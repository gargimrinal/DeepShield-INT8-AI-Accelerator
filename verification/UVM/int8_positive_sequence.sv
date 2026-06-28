`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 18:01:10
// Design Name: 
// Module Name: int8_positive_sequence
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 17:48:24
// Design Name: 
// Module Name: int8_directed_sequence
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
`ifndef INT8_POSITIVE_SEQUENCE_SV
`define INT8_POSITIVE_SEQUENCE_SV

class int8_positive_sequence extends uvm_sequence #(int8_seq_item);

    `uvm_object_utils(int8_positive_sequence)

    function new(string name="int8_positive_sequence");
        super.new(name);
    endfunction

    task body();

        int8_seq_item req;

        req = int8_seq_item::type_id::create("req");

        start_item(req);

        req.a_left = '{10,20,30,40};
        req.w_top  = '{5,6,7,8};

        finish_item(req);

    endtask

endclass

`endif
