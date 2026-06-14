`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 19:16:19
// Design Name: 
// Module Name: pe_scoreboard
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
class pe_scoreboard;
integer pass_count;
integer fail_count;
function new();

    pass_count = 0;
    fail_count = 0;

endfunction
task check(

    input logic signed [19:0] expected,
    input logic signed [19:0] actual

);

    if(expected === actual) begin

        pass_count++;

        $display(
            "PASS : Expected=%0d Actual=%0d",
            expected,
            actual
        );

    end

    else begin

        fail_count++;

        $error(
            "FAIL : Expected=%0d Actual=%0d",
            expected,
            actual
        );

    end

endtask
    
endclass
