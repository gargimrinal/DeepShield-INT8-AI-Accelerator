`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name: int8_scoreboard
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// Basic scoreboard for the INT8 Accelerator.
// Receives transactions from the monitor.
// Comparison logic will be added later.
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef INT8_SCOREBOARD_SV
`define INT8_SCOREBOARD_SV

class int8_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(int8_scoreboard)

    // Receives transactions from the monitor
    uvm_analysis_imp #(int8_seq_item, int8_scoreboard) analysis_export;

    //---------------------------------------------------------
    // Constructor
    //---------------------------------------------------------
    function new(string name = "int8_scoreboard",
                 uvm_component parent = null);

        super.new(name, parent);

        analysis_export = new("analysis_export", this);

    endfunction

    //---------------------------------------------------------
    // Called whenever monitor sends a transaction
    //---------------------------------------------------------
    function void write(int8_seq_item tr);

        `uvm_info("SCOREBOARD",
                  "Transaction received from monitor",
                  UVM_MEDIUM)

        // Display captured inputs
        `uvm_info("SCOREBOARD",
                  $sformatf("A = %p", tr.a_left),
                  UVM_LOW)

        `uvm_info("SCOREBOARD",
                  $sformatf("W = %p", tr.w_top),
                  UVM_LOW)

        // Output comparison will be added later

    endfunction

endclass

`endif
