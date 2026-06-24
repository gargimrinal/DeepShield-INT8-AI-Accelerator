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

    // Wait until reset is released
    wait(vif.rst_n == 1);

    // Optional: align to the next clock edge
    @(posedge vif.clk);

    forever begin

        seq_item_port.get_next_item(req);

        `uvm_info("DRIVER",
                  "Transaction Received",
                  UVM_MEDIUM)

        // Wait for a clock edge
        `uvm_info("DRIVER","Waiting for first clock",UVM_MEDIUM)

@(posedge vif.clk);

`uvm_info("DRIVER","First clock received",UVM_MEDIUM)

vif.start <= 1;

`uvm_info("DRIVER","Start asserted",UVM_MEDIUM)
        for (int i = 0; i < $size(vif.a_left); i++) begin
            vif.a_left[i] <= req.a_left[i];
        end

        for (int j = 0; j < $size(vif.w_top); j++) begin
            vif.w_top[j] <= req.w_top[j];
        end

        // Start pulse = 1 clock
 `uvm_info("DRIVER","Waiting for second clock",UVM_MEDIUM)
@(posedge vif.clk);
`uvm_info("DRIVER","Second clock received",UVM_MEDIUM)

vif.start <= 0;

`uvm_info("DRIVER","About to execute wait(done)",UVM_MEDIUM)

$display("[%0t] done=%0b", $time, vif.done);

wait(vif.done);

$display("[%0t] wait finished", $time);

`uvm_info("DRIVER","Done detected",UVM_MEDIUM)
        `uvm_info("DRIVER",
                  "DUT Finished",
                  UVM_MEDIUM)

        seq_item_port.item_done();

    end

endtask

endclass

`endif
