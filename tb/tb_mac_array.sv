`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2026 09:45:38
// Design Name: 
// Module Name: tb_mac_array
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
module tb_mac_array;
parameter data_width = 8;
    parameter acc_width = 2*data_width + 4;
logic clk,rst_n,en,clr;
logic signed [7:0] a [1:0][1:0];
logic signed [7:0] b [1:0][1:0];
logic signed [19:0] acc[1:0][1:0];
mac_array #(
.data_width(data_width),
        .acc_width(acc_width)) 
        dut(.*);
        logic signed [19:0] acc00, acc01, acc10, acc11;

assign acc00 = acc[0][0];
assign acc01 = acc[0][1];
assign acc10 = acc[1][0];
assign acc11 = acc[1][1];
always #5 clk = ~clk;
initial begin
   clk = 0;
    rst_n = 0;
    en = 0;
    clr=0;
    a[0][0] = 0; b[0][0] = 0;
    a[0][1] = 0; b[0][1] = 0;
    a[1][0] = 0; b[1][0] = 0;
    a[1][1] = 0; b[1][1] = 0;
    #10;
    rst_n = 1;
    en = 1;
    a[0][0] = 2; b[0][0] = 3;
    a[0][1] = 4; b[0][1] = 5;
    a[1][0] = 1; b[1][0] = 7;
    a[1][1] = 2; b[1][1] = 3;
    #20;
    en=0;
    #20;
    clr=1;
    #10;
    clr=0;
    #20;
    en=1;
     a[0][0] = 3; b[0][0] = 3;
    a[0][1] = 1; b[0][1] = 2;
    a[1][0] = 5; b[1][0] = 2;
    a[1][1] = 4; b[1][1] = 4;
    #20;
    $display("y[0][0] = %0d,y[0][1] = %0d", acc[0][0],acc[0][1]);
    $display("y[1][0] = %0d,y[1][1] = %0d", acc[1][0],acc[1][1]);
    #10;
$finish;
end
endmodule
