`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 10:47:48
// Design Name: 
// Module Name: tb_pe
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
module tb_pe;

parameter data_width = 8;
parameter acc_width  = 2*data_width+4;
logic clk;
logic rst_n;
logic en;
logic signed [data_width-1:0] a_in;
logic signed [data_width-1:0] w_in;
logic signed [acc_width-1:0]  psum_in;
logic signed [data_width-1:0] a_out;
logic signed [data_width-1:0] w_out;
logic signed [acc_width-1:0]  psum_out;

pe #(
    .data_width(data_width),
    .acc_width(acc_width)
) dut (.*);
   initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
initial begin
// initialization
    rst_n   = 0;
    en      = 0;
    a_in    = 0;
    w_in    = 0;
    psum_in = 0;

    // reset
    #10;
    rst_n = 1;
    en    = 1;

    // test 1
    #10;
    a_in    = 3;
    w_in    = 4;
    psum_in = 0;

    // expected:
    // psum_out = 12

    // test 2
    #10;
    a_in    = 2;
    w_in    = 5;
    psum_in = 12;

    // expected:
    // psum_out = 22

    // test 3
    #10;
    a_in    = -2;
    w_in    = 6;
    psum_in = 22;

    // expected:
    // psum_out = 10

    #20;
    $finish;

end
// monitor
initial begin
    $monitor(
        "TIME=%0t | a_in=%0d w_in=%0d psum_in=%0d | a_out=%0d w_out=%0d psum_out=%0d",
        $time,
        a_in,
        w_in,
        psum_in,
        a_out,
        w_out,
        psum_out
    );
end
endmodule
