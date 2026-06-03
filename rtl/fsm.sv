`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 09:30:03
// Design Name: 
// Module Name: fsm
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
module fsm(
    input logic clk,
    input logic rst_n,
    input logic start,

    output logic en,
    output logic done
    );
    //state definitions
typedef enum logic [1:0] {

    IDLE,
    LOAD,
    COMPUTE,
    DONE

} state_t;

state_t state;
state_t next_state;

//current state logic
    always_ff @(posedge clk or negedge rst_n) begin

    if(!rst_n)
        state <= IDLE;
    else
        state <= next_state;

end

//next state logic
always_comb begin

    next_state = state;

    case(state)

        IDLE:
            if(start)
                next_state = LOAD;

        LOAD:
            next_state = COMPUTE;

        COMPUTE:
            next_state = DONE;

        DONE:
            next_state = IDLE;

    endcase
end

//output logic
always_comb begin

    en   = 0;
    done = 0;

    case(state)

        LOAD:
            en = 1;

        COMPUTE:
            en = 1;

        DONE:
            done = 1;
 endcase
 end
endmodule
