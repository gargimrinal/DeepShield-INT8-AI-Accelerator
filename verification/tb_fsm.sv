`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 09:35:25
// Design Name: 
// Module Name: tb_fsm
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
module tb_fsm;

logic clk;
logic rst_n;
logic start;

logic en;
logic done;

fsm dut (
    .clk(clk),
    .rst_n(rst_n),
    .start(start),
    .en(en),
    .done(done)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
//en and done checking
task check_outputs(
    input logic exp_en,
    input logic exp_done
);

begin

    if(en !== exp_en)
        $error("FAIL: Expected en=%0b Got=%0b",
               exp_en,en);
    else
        $display("PASS: en=%0b",en);

    if(done !== exp_done)
        $error("FAIL: Expected done=%0b Got=%0b",
               exp_done,done);
    else
        $display("PASS: done=%0b",done);

end

endtask
initial begin
rst_n = 0;
start = 0;
//no start checking
#10;
rst_n = 1;

repeat(5) begin
    @(posedge clk);
    #1;
    check_outputs(0,0);
end
#1;
@(posedge clk);
#1;
check_outputs(0,0); // IDLE
#10;
rst_n = 1;

#10;
start = 1;

@(posedge clk);
#1;
check_outputs(1,0); // LOAD

start = 0;

@(posedge clk);
#1;
check_outputs(1,0); // COMPUTE

@(posedge clk);
#1;
check_outputs(0,1); // DONE

@(posedge clk);
#1;
check_outputs(0,0); // IDLE

#20;
$finish;

end

initial begin
    $monitor(
        "TIME=%0t | start=%0b | en=%0b | done=%0b",
        $time,
        start,
        en,
        done
    );
end

endmodule
