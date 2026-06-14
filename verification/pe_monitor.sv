`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 19:51:14
// Design Name: 
// Module Name: pe_monitor
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
class pe_monitor;

    logic signed [19:0] psum_out;
    logic overflow;
    task sample(

    input logic signed [19:0] dut_psum_out,
    input logic dut_overflow

);

    psum_out = dut_psum_out;
    overflow = dut_overflow;

    $display(
        "[MONITOR] psum_out=%0d overflow=%0b",
        psum_out,
        overflow
    );

endtask

endclass
