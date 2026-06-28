`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 11:33:27
// Design Name: 
// Module Name: int8_enviro
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
`ifndef INT8_ENVIRO_SV
`define INT8_ENVIRO_SV
class int8_enviro extends uvm_env;
    `uvm_component_utils(int8_enviro)

    int8_agent agent;
    int8_scoreboard sb;
    int8_coverage cov;

    function new(string name="int8_enviro",
                 uvm_component parent=null);

        super.new(name,parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        agent = int8_agent::type_id::create("agent", this);
sb = int8_scoreboard::type_id::create("sb", this);
cov = int8_coverage::type_id::create("cov", this);
    endfunction

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    $display("CONNECT PHASE CALLED");

    agent.mon.ap.connect(sb.analysis_export);
    agent.mon.ap.connect(cov.analysis_export);

endfunction
endclass
`endif