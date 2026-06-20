`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 12:44:33
// Design Name: 
// Module Name: int8_env
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
class int8_env;

    int8_transaction  tr;
    int8_monitor      mon;
    int8_scoreboard   sb;
    int8_golden_model gm;

    function new();

        tr  = new();
        mon = new();
        sb  = new();
        gm  = new();

    endfunction

endclass

