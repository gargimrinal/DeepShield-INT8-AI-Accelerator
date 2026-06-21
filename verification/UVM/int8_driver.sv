`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 15:35:03
// Design Name: 
// Module Name: int8_driver
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
`ifndef INT8_DRIVER_SV
`define INT8_DRIVER_SV

class int8_driver extends uvm_driver #(int8_seq_item);

    `uvm_component_utils(int8_driver)

    // Virtual interface
    virtual int8_if vif;

    // Constructor
    function new(string name = "int8_driver",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction

    // Build Phase
    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if(!uvm_config_db #(virtual int8_if)::get(this,
                                                  "",
                                                  "vif",
                                                  vif))
        begin
            `uvm_fatal("NOVIF",
                       "Virtual Interface not found")
        end

    endfunction

    // Run Phase
    task run_phase(uvm_phase phase);

        super.run_phase(phase);

    endtask

endclass

`endif
