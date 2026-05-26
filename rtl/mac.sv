//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 15:56:17
// Design Name: 
// Module Name: mac
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
module mac #(
  parameter int data_width = 8,
  parameter int acc_width  = 2 * data_width + 4
) (
  input  logic clk, rst_n, en, clr,
  input  logic signed [data_width-1:0] a,
  input  logic signed [data_width-1:0] b,
  output logic signed [acc_width-1:0]  accumulator
);
logic signed [(2*data_width)-1:0] mult;
  assign mult = a * b;
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      accumulator <= '0;
    end else if (clr) begin
      accumulator <= '0;
    end else if (en) begin
      accumulator <= accumulator + mult;
    end
  end
endmodule

