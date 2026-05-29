`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 10:35:10
// Design Name: 
// Module Name: pe
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
module pe #(
    parameter data_width = 8,
    parameter acc_width  = 2*data_width+4
)(
    input  logic clk,
    input  logic rst_n,
    input  logic en,

    input  logic signed [data_width-1:0] a_in, //comes from left
    input  logic signed [data_width-1:0] w_in, //comes from top
    input  logic signed [acc_width-1:0] psum_in, //accumulated result

    output logic signed [data_width-1:0] a_out, //goes to pe on right
    output logic signed [data_width-1:0] w_out, //goes to pe below
    output logic signed [acc_width-1:0] psum_out //accumulated output
);
logic signed [data_width-1:0] a_reg;
logic signed [data_width-1:0] w_reg;
logic signed [acc_width-1:0] psum_reg;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a_reg    <= '0;
        w_reg    <= '0;
        psum_reg <= '0;
    end
else if (en) begin
        a_reg <= a_in;
        w_reg <= w_in;
        psum_reg <= psum_in + (a_in * w_in);
    end
end
assign a_out    = a_reg;
assign w_out    = w_reg;
assign psum_out = psum_reg;
endmodule
