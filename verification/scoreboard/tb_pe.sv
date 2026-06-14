`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date: 29.05.2026 10:47:48
// Design Name: 
// Module Name: tb_pe
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
module tb_pe;

parameter data_width = 8;
parameter acc_width  = 2*data_width+4;
logic clk;
logic rst_n;
logic en;
logic overflow;
logic signed [data_width-1:0] a_in;
logic signed [data_width-1:0] w_in;
logic signed [acc_width-1:0]  psum_in;
logic signed [data_width-1:0] a_out;
logic signed [data_width-1:0] w_out;
logic signed [acc_width-1:0]  psum_out;
logic signed [acc_width-1:0] expected;

pe #(
    .data_width(data_width),
    .acc_width(acc_width)
) dut (.*);
pe_transaction tr;
pe_scoreboard sb;
   initial begin
   tr = new();
   sb = new();
    clk = 0;
    forever #5 clk = ~clk;
    end
// overflow check
task check_overflow(
input logic expected_overflow
);
 if (overflow !== expected_overflow)
        $error("FAIL: Expected Overflow=%0b Got=%0b",
                expected_overflow,
                overflow);
    else
        $display("PASS: Overflow=%0b",
                  overflow);

endtask
//reset check
task check_reset;

    if (a_out !== 0)
        $error("FAIL: a_out not reset");

    if (w_out !== 0)
        $error("FAIL: w_out not reset");

    if (psum_out !== 0)
        $error("FAIL: psum_out not reset");

    if (overflow !== 0)
        $error("FAIL: overflow not reset");

    if (a_out == 0 &&
        w_out == 0 &&
        psum_out == 0 &&
        overflow == 0)
        $display("PASS: Reset");

endtask
initial begin
// initialization
    rst_n   = 0;
    en      = 0;
    a_in    = 0;
    w_in    = 0;
    psum_in = 0;
    
    rst_n = 0;

#1;

check_reset();

    // reset
    #10;
    rst_n = 1;
    en    = 1;

    // test1
    #10;
    if (!tr.randomize())
    $fatal("Randomization failed");

tr.display();

a_in    = tr.a_in;
w_in    = tr.w_in;
psum_in = tr.psum_in;

expected = $signed(tr.a_in) * $signed(tr.w_in) + $signed(tr.psum_in);

tr.display();
    @(posedge clk);
    #1;
    // psum_out = 12
    sb.check(expected, psum_out);

    // test 2
    #10;
    a_in    = 2;
    w_in    = 5;
    psum_in = 12;
     expected = 22;
    @(posedge clk);
    #1;
    sb.check(expected, psum_out);

    // expected:
    // psum_out = 22

    // test 3
    #10;
    a_in    = -2;
    w_in    = 6;
    psum_in = 22;
 expected = 10;
    @(posedge clk);
    #1;
    // expected:
    // psum_out = 10
    sb.check(expected, psum_out);
    #10;

a_in    = 127;
w_in    = 127;
psum_in = 520000;
expected = 524287; // MAX_POS for 20-bit signed

@(posedge clk);
#1;

sb.check(expected, psum_out);
check_overflow(1'b1);
 #10;
 //negative overflow test
 a_in    = -128;
w_in    = 127;
psum_in = -520000;

expected = -524288;

@(posedge clk);
#1;

sb.check(expected, psum_out);
check_overflow(1'b1);

    #20;
// RANDOM TESTS

$display(" RANDOM TESTS ");
repeat (20) begin

    if (!tr.randomize())
        $fatal("Randomization Failed");

    a_in    = tr.a_in;
    w_in    = tr.w_in;
    psum_in = tr.psum_in;

    expected = a_in * w_in + psum_in;

    tr.display();

    @(posedge clk);
    #1;

    sb.check(expected, psum_out);

end
$display("\n========== SCOREBOARD SUMMARY ==========");
$display("PASS = %0d", sb.pass_count);
$display("FAIL = %0d", sb.fail_count);
$display("========================================");

    $finish;

end
// monitor
initial begin
   $monitor(
"TIME=%0t | a=%0d w=%0d psum_in=%0d psum_out=%0d overflow=%0b",
$time,
a_in,
w_in,
psum_in,
psum_out,
overflow
);
end
endmodule