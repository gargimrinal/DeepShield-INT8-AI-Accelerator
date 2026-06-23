`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 11:08:15
// Design Name: 
// Module Name: int8_monitor_
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
`ifndef INT8_MONITOR_SV
`define INT8_MONITOR_SV

class int8_monitor extends uvm_monitor;

    `uvm_component_utils(int8_monitor)

    virtual int8_if vif;

    uvm_analysis_port #(int8_seq_item) ap;

    function new(string name = "int8_monitor",
                 uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db #(virtual int8_if)::get(this,
                                                  "",
                                                  "vif",
                                                  vif))
            `uvm_fatal("NOVIF","Virtual Interface not found");
    endfunction

    task run_phase(uvm_phase phase);

        int8_seq_item tr;

        forever begin
            @(posedge vif.clk);

            tr = int8_seq_item::type_id::create("tr");

            // We'll fill this in later.

            ap.write(tr);
        end

    endtask

endclass

`endif
