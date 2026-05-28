`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 08:27:29
// Design Name: 
// Module Name: tb_mac_2x2arr
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
module tb_mac_2x2arr;
 parameter data_width = 8;
    parameter acc_width = 2*data_width + 4;
logic clk;
    logic rst_n;
    logic en;
    logic clr;
logic signed [data_width-1:0] a00, a01, a10, a11;
logic signed [data_width-1:0] b00, b01, b10, b11;
 logic signed [acc_width-1:0] y00, y01, y10, y11;
 mac_2x2arr #(
        .data_width(data_width),
        .acc_width(acc_width)
    ) dut (.*);
 always #5 clk = ~clk;
initial begin
 $monitor(
            "TIME=%0t | y00=%0d y01=%0d y10=%0d y11=%0d",
            $time, y00, y01, y10, y11
        );

        // initial values
        clk   = 0;
        rst_n = 0;
        en    = 0;
        clr   = 0;
         a00 = 0; a01 = 0;
        a10 = 0; a11 = 0;
         b00 = 0; b01 = 0;
        b10 = 0; b11 = 0;

        #15;
        rst_n = 1;
//cycle 1
        @(negedge clk);
en = 1;
 a00 = 2; b00 = 3;   
 a01 = 4; b01 = 5;   
a10 = 1; b10 = 7;   
 a11 = 2; b11 = 2;   
//cycle 2
        @(posedge clk);
//cycle 3
        @(posedge clk);
en = 0;
//cycle 4
        @(negedge clk);
clr = 1;
//cycle 5
        @(posedge clk);
clr = 0;
@(negedge clk);
        en  = 1;
 a00 = 3; b00 = 3;   
 a01 = 1; b01 = 2;   
 a10 = 5; b10 = 2;   
 a11 = 4; b11 = 4;
 @(posedge clk);
 @(posedge clk);
 en = 0;
 #20;
  $finish;
end
endmodule
