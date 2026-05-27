`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2026 09:30:21
// Design Name: 
// Module Name: mac_array
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
module mac_array #(
parameter data_width=8,
parameter acc_width= 2*data_width+4
)( 
input logic clk, rst_n, en,clr,
input logic signed [data_width-1:0]a[1:0][1:0],
input logic signed [data_width-1:0]b [1:0][1:0],
output logic signed [acc_width-1:0] acc[1:0][1:0]
 );
genvar i, j;
generate
 for(i = 0; i < 2; i++) begin : row_gen
 for(j = 0; j < 2; j++) begin : col_gen
     mac #(
                .data_width(data_width),
                .acc_width(acc_width)
            ) u_mac (

                .clk(clk),
                .rst_n(rst_n),
                .en(en),
                .clr(clr),
                .a(a[i][j]),
                .b(b[i][j]),
               .accumulator(acc[i][j])
);

       end
end
endgenerate
endmodule
