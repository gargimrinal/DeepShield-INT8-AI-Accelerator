`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 13:07:23
// Design Name: 
// Module Name: int8_golden_model
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
`ifndef INT8_GOLDEN_MODEL_SV
`define INT8_GOLDEN_MODEL_SV

class int8_golden_model;

    localparam DATA_WIDTH = 8;
    localparam ACC_WIDTH  = 20;
    localparam ROWS = 4;
    localparam COLS = 4;

    function new();
    endfunction

    //--------------------------------------------------
    // Saturation logic copied from PE RTL
    //--------------------------------------------------

    function automatic signed [ACC_WIDTH-1:0]
    saturate(input signed [ACC_WIDTH:0] result);

        logic signed [ACC_WIDTH-1:0] MAX_POS;
        logic signed [ACC_WIDTH-1:0] MIN_NEG;

        MAX_POS = {1'b0,{(ACC_WIDTH-1){1'b1}}};
        MIN_NEG = {1'b1,{(ACC_WIDTH-1){1'b0}}};

        if(result > MAX_POS)
            return MAX_POS;

        else if(result < MIN_NEG)
            return MIN_NEG;

        else
            return result[ACC_WIDTH-1:0];

    endfunction

    //--------------------------------------------------
    // Prediction
    //--------------------------------------------------
function void predict(ref int8_seq_item tr);

    logic signed [ACC_WIDTH-1:0] psum;
    logic signed [ACC_WIDTH:0] temp;

    for (int r = 0; r < ROWS; r++) begin

        psum = '0;

        for (int c = 0; c < COLS; c++) begin

            temp = psum +
                   (tr.a_left[r] * tr.w_top[c]);

            psum = saturate(temp);

            tr.expected[r][c] = psum;
$display("Expected[%0d][%0d] = %0d",
         r,
         c,
         tr.expected[r][c]);
        end

    end

endfunction

endclass

`endif
