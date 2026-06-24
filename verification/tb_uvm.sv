`timescale 1ns / 1ps
import uvm_pkg::*;
`include "uvm_macros.svh"

import int8_pkg::*;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 14:53:42
// Design Name: 
// Module Name: tb_uvm
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
/////////////////////////////////////////////////////////////////////////////////

module tb_uvm;

parameter DATA_WIDTH = 8;
parameter ACC_WIDTH  = 20;
parameter ROWS = 4;
parameter COLS = 4;

int8_if vif();


int8_accelerator #(
    .data_width(DATA_WIDTH),
    .acc_width(ACC_WIDTH),
    .ROWS(ROWS),
    .COLS(COLS)
) dut (

    .clk   (vif.clk),
    .rst_n (vif.rst_n),
    .start (vif.start),

    .a_left(vif.a_left),
    .w_top (vif.w_top),

    .done(vif.done),
    .y(vif.y)

);
initial begin
    vif.clk = 0;
    forever #5 vif.clk = ~vif.clk;
end
//reset
initial begin

    vif.rst_n = 0;
    vif.start = 0;

    repeat(5) @(posedge vif.clk);

    vif.rst_n = 1;

end
//start uvm
initial begin

    uvm_config_db#(virtual int8_if)::set(
        null,
        "*",
        "vif",
        vif
    );

    run_test("int8_test");
end
endmodule