`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 15:51:06
// Design Name: 
// Module Name: mac_2x2arr
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
module mac_2x2arr #(
parameter data_width=8,
parameter acc_width= 2*data_width+4
) (
input logic clk, rst_n, en, clr,
//a input
input logic signed[data_width-1:0]a00,
input logic signed [data_width-1:0]a01,
input logic signed [data_width-1:0]a10,
input logic signed [data_width-1:0]a11,
//b input
input logic signed [data_width-1:0]b00,
input logic signed [data_width-1:0]b01,
input logic signed [data_width-1:0]b10,
input logic signed [data_width-1:0]b11,
//output
output logic signed [acc_width-1:0]y00,
output logic signed [acc_width-1:0]y01,
output logic signed [acc_width-1:0]y10,
output logic signed [acc_width-1:0]y11
);
//mac00
mac #(.data_width(data_width),
.acc_width(acc_width))
mac00 (
 .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a(a00),
        .b(b00),
        .accumulator(y00)
        );
 //mac01
 mac #(.data_width(data_width),
.acc_width(acc_width))
mac01 (
 .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a(a01),
        .b(b01),
        .accumulator(y01)
        );
//mac10
mac #(.data_width(data_width),
.acc_width(acc_width))
mac10 (
 .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a(a10),
        .b(b10),
        .accumulator(y10)
        );
 //mac11
 mac #(.data_width(data_width),
.acc_width(acc_width))
mac11 (
 .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a(a11),
        .b(b11),
        .accumulator(y11)
        );
        always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        y00 <= 0;
        y01 <= 0;
        y10 <= 0;
        y11 <= 0;
    end
    else if(clr) begin
        y00 <= 0;
        y01 <= 0;
        y10 <= 0;
        y11 <= 0;
    end
    else if(en) begin
        y00 <= (a00*b00) + (a01*b10);
        y01 <= (a00*b01) + (a01*b11);

        y10 <= (a10*b00) + (a11*b10);
        y11 <= (a10*b01) + (a11*b11);
    end
end
endmodule
