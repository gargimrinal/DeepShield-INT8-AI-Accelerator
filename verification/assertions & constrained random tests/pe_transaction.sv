`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 07:06:42
// Design Name: 
// Module Name: pe_transaction
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
class pe_transaction;
    rand bit signed [7:0]  a_in;
    rand bit signed [7:0]  w_in;
    rand bit signed [19:0] psum_in;

    bit signed [19:0] expected;
    constraint psum_c {
        psum_in inside {[-5000:5000]};
    }

    // Avoid trivial all-zero test
    constraint non_zero_c {
        !(a_in == 0 && w_in == 0);
    }

    // Encourage edge values
    constraint edge_values_c {
        a_in dist {
            -128 := 5,
            127  := 5,
            0    := 2,
            [-127:-1] := 20,
            [1:126]   := 20
        };

        w_in dist {
            -128 := 5,
            127  := 5,
            0    := 2,
            [-127:-1] := 20,
            [1:126]   := 20
        };
    }

    function void display();
        $display("--------------------------------");
        $display("a_in     = %0d", a_in);
        $display("w_in     = %0d", w_in);
        $display("psum_in  = %0d", psum_in);
        $display("expected = %0d", expected);
        $display("--------------------------------");
    endfunction

endclass
