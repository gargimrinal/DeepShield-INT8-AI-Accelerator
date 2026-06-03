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

initial begin

    rst_n = 0;
    start = 0;

    #10;
    rst_n = 1;

    #10;
    start = 1;

    #10;
    start = 0;

    #50;

    start = 1;

    #10;
    start = 0;

    #50;

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
