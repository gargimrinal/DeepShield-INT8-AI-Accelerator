`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 11:44:48
// Design Name: 
// Module Name: int8_test
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
`ifndef INT8_TEST_SV
`define INT8_TEST_SV
class int8_test extends uvm_test;

    `uvm_component_utils(int8_test)

    int8_enviro env;

    function new(string name="int8_test",
                 uvm_component parent=null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = int8_enviro::type_id::create("env", this);
    endfunction
//run phase generation
  task run_phase(uvm_phase phase);

    int8_regression_sequence seq;

    phase.raise_objection(this);

    seq = int8_regression_sequence::type_id::create("seq");

    seq.start(env.agent.seqr);

    phase.drop_objection(this);

endtask

endclass
`endif