`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 09:53:00
// Design Name: 
// Module Name: tb_int8_accelerator
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
module tb_int8_accelerator;

parameter data_width = 8;
parameter acc_width  = 2*data_width+4;
parameter ROWS = 4;
parameter COLS = 4;

logic clk;
logic rst_n;
logic start;

logic signed [data_width-1:0] a_left [ROWS-1:0];
logic signed [data_width-1:0] w_top  [COLS-1:0];
logic done;
logic signed [acc_width-1:0] y [ROWS-1:0][COLS-1:0];
logic signed [acc_width-1:0] expected [ROWS-1:0][COLS-1:0];


int8_accelerator #(
.data_width(data_width),
.acc_width(acc_width),
.ROWS(ROWS),
.COLS(COLS)
) dut (
.clk(clk),
.rst_n(rst_n),
.start(start),
.a_left(a_left),
.w_top(w_top),
.done(done),
.y(y)
);

// self checking
task check_reset;

integer i;
integer j;

begin
for(i=0; i<ROWS; i=i+1) begin
    for(j=0; j<COLS; j=j+1) begin

        if(y[i][j] !== 0)
            $error("FAIL: Reset y[%0d][%0d]=%0d",
                   i,j,y[i][j]);

    end
end
if(done !== 0)
    $error("FAIL: done not cleared by reset");
else
    $display("PASS: Reset Check");
end

endtask

task check_done;

begin
 if(done !== 1'b1)
        $error("FAIL: done not asserted");
    else
        $display("PASS: done asserted");

end

endtask

task check_outputs_valid;

integer i;
integer j;

begin
for(i=0; i<ROWS; i=i+1) begin
    for(j=0; j<COLS; j=j+1) begin

        if(^y[i][j] === 1'bx)
            $error("FAIL: y[%0d][%0d] contains X/Z",
                   i,j);

    end
end

$display("PASS: Output Matrix Valid");

end

endtask

int8_env env;

initial begin
env = new();

clk = 0;
forever #5 clk = ~clk;
end

//assertions
property reset_outputs_zero;

@(posedge clk)

!rst_n |-> (done == 0);

endproperty

assert property(reset_outputs_zero)
else
    $error("ASSERTION FAILED: done not low during reset");
    
    property start_to_done;

@(posedge clk)
start |=> ##[1:20] done;

endproperty

assert property(start_to_done)
else
    $error("ASSERTION FAILED: start did not lead to done");
    
    property done_only_after_start;

@(posedge clk)
done |-> !$past(rst_n) || $past(start,1) || $past(start,2) || $past(start,3);

endproperty

assert property(done_only_after_start)
else
    $error("ASSERTION FAILED: done asserted without start");
    
    //coverage
    covergroup accel_cg @(posedge clk);

    coverpoint start;
    coverpoint done;

endgroup
accel_cg cg = new();
    
initial begin
rst_n = 0;
start = 0;

a_left[0] = 0;
a_left[1] = 0;
a_left[2] = 0;
a_left[3] = 0;

w_top[0] = 0;
w_top[1] = 0;
w_top[2] = 0;
w_top[3] = 0;

#1;
check_reset();

#9;
rst_n = 1;

#10;

$display("Running Test 1");

a_left[0] = 1;
a_left[1] = 2;
a_left[2] = 3;
a_left[3] = 4;

w_top[0] = 5;
w_top[1] = 6;
w_top[2] = 7;
w_top[3] = 8;

start = 1;

#10;
start = 0;

@(posedge done);
env.mon.sample(done, y);

env.gm.predict(
a_left,
w_top,
expected
);
env.sb.check(
expected,
y
);
$display("\nEXPECTED MATRIX");

for(int i=0;i<ROWS;i++) begin
    for(int j=0;j<COLS;j++)
        $write("%8d ", expected[i][j]);
    $display("");
end

$display("\nDUT MATRIX");

for(int i=0;i<ROWS;i++) begin
    for(int j=0;j<COLS;j++)
        $write("%8d ", y[i][j]);
    $display("");
end

check_done();
check_outputs_valid();

#20;

$display("Running Test 2");

a_left[0] = -1;
a_left[1] = -2;
a_left[2] = 3;
a_left[3] = 4;

w_top[0] = 2;
w_top[1] = -3;
w_top[2] = 4;
w_top[3] = -5;

start = 1;

#10;
start = 0;
@(posedge done);

env.mon.sample(done, y);

env.gm.predict(
    a_left,
    w_top,
    expected
);

env.sb.check(
    expected,
    y
);

check_done();
check_outputs_valid();

#20;

$display("TOP LEVEL SELF-CHECKING TB COMPLETED");
$display("\n========== RANDOM TESTING ==========");

repeat (20) begin

    assert(env.tr.randomize())
    else
        $fatal("Transaction Randomization Failed");

    // Drive randomized inputs
    for (int i = 0; i < ROWS; i++)
        a_left[i] = env.tr.a_left[i];

    for (int j = 0; j < COLS; j++)
        w_top[j] = env.tr.w_top[j];

    env.tr.display();

    start = 1;
    #10;
    start = 0;

    @(posedge done);

    env.mon.sample(done, y);

    env.gm.predict(
        a_left,
        w_top,
        expected
    );

    env.sb.check(
        expected,
        y
    );

    $display("Output Matrix:");

    for (int i = 0; i < ROWS; i++) begin
        for (int j = 0; j < COLS; j++)
            $write("%8d ", y[i][j]);
        $display("");
    end

    check_done();
    check_outputs_valid();

    #20;

end

$display("\n========== SCOREBOARD SUMMARY ==========");
$display("PASS = %0d", env.sb.pass_count);
$display("FAIL = %0d", env.sb.fail_count);
$display("========================================");

$finish;

end

endmodule

