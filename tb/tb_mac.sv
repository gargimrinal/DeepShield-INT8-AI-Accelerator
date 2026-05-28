//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 16:00:18
// Design Name: 
// Module Name: tb_mac
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
`timescale 1ns/1ps
module tb_mac;
parameter data_width = 8;
    parameter acc_width  = 2*data_width + 4;
    logic               clk;
    logic               rst_n;
    logic               clr;
    logic               en;
    logic signed[data_width-1:0]a;
    logic signed[data_width-1:0]b;
    logic signed[acc_width-1:0]   accumulator;

    mac #(.data_width(data_width), .acc_width(acc_width)) dut (.*);

    always #5 clk = ~clk;
initial begin
//initialize
        clk = 0; rst_n = 0; clr = 0; en = 0; a = 0; b = 0;
        #15 rst_n = 1; 
//cycle 1
        @(negedge clk);
        en = 1; a = 8'd2; b = 8'd3;
//cycle 2
        @(negedge clk);
        a = 8'd4; b = 8'd5;
//cycle 3
        @(negedge clk);
        en = 0; a = 8'd10; b= 8'd10;
//cycle 4
        @(negedge clk);
        clr = 1;
//cycle 5
        @(negedge clk);
        clr = 0; en = 1; a= 8'd3; b = 8'd3;

        @ (negedge clk);
        en = 0;
        #100;
        $finish;
    end
endmodule
