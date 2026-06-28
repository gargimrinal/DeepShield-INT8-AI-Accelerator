`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 07:49:28
// Design Name: 
// Module Name: int8_coverage
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
`ifndef INT8_COVERAGE_SV
`define INT8_COVERAGE_SV

class int8_coverage extends uvm_subscriber #(int8_seq_item);

    `uvm_component_utils(int8_coverage)

    int8_seq_item tr;

    //------------------------------------------------------
    // Covergroup
    //------------------------------------------------------
covergroup cg with function sample(
    logic signed [7:0] a0,
    logic signed [7:0] w0,
    logic signed [19:0] y00
);

    cp_a0 : coverpoint a0 {
        bins neg = {[-128:-1]};
        bins zero = {0};
        bins pos = {[1:127]};
    }

    cp_w0 : coverpoint w0 {
        bins neg = {[-128:-1]};
        bins zero = {0};
        bins pos = {[1:127]};
    }

    cross cp_a0, cp_w0;

    cp_a_extreme : coverpoint a0 {
        bins min = {-128};
        bins max = {127};
    }

    cp_w_extreme : coverpoint w0 {
        bins min = {-128};
        bins max = {127};
    }

    cp_y00 : coverpoint y00 {
        bins neg = {[-524288:-1]};
        bins zero = {0};
        bins pos = {[1:524287]};
    }

endgroup

    function new(string name="int8_coverage",
                 uvm_component parent=null);

        super.new(name,parent);

        cg = new();

    endfunction

 function void write(int8_seq_item t);

    $display("[%0t] COVERAGE WRITE CALLED", $time);
$display("Coverage now = %0.2f%%", cg.get_coverage());

    cg.sample(
        t.a_left[0],
        t.w_top[0],
        t.y[0][0]
    );

    $display("Coverage = %0.2f%%", cg.get_coverage());

endfunction
function void report_phase(uvm_phase phase);

    real cov;

    $display("REPORT PHASE ENTERED");

    cov = cg.get_coverage();

    $display("Coverage = %0.2f%%", cov);

endfunction
endclass

`endif
