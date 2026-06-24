`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 11:26:19
// Design Name: 
// Module Name: int8_agent
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

`ifndef INT8_AGENT_SV
`define INT8_AGENT_SV

class int8_agent extends uvm_agent;

    `uvm_component_utils(int8_agent)

    // Components
    int8_driver     drv;
    int8_sequencer  seqr;
    int8_monitor    mon;

    // Constructor
    function new(string name = "int8_agent",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    // Build Phase
    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        drv  = int8_driver    ::type_id::create("drv", this);
        seqr = int8_sequencer ::type_id::create("seqr", this);
        mon  = int8_monitor   ::type_id::create("mon", this);

    endfunction


    // Connect Phase
    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        drv.seq_item_port.connect(seqr.seq_item_export);

    endfunction

endclass

`endif
