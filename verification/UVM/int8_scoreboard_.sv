`timescale 1ns/1ps
`ifndef INT8_SCOREBOARD_SV
`define INT8_SCOREBOARD_SV

class int8_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(int8_scoreboard)

    localparam DATA_WIDTH = 8;
    localparam ACC_WIDTH  = 20;
    localparam ROWS = 4;
    localparam COLS = 4;

    uvm_analysis_imp #(int8_seq_item,int8_scoreboard) analysis_export;

    int8_golden_model golden;
int unsigned txn_id = 0;
    function new(string name="int8_scoreboard",
                 uvm_component parent=null);

        super.new(name,parent);

        analysis_export = new("analysis_export",this);

        golden = new();

    endfunction
function void write(int8_seq_item tr);
txn_id++;
    golden.predict(tr);

    foreach(tr.expected[i,j]) begin

       if(tr.expected[i][j] == tr.y[i][j])

    `uvm_info(
        "COMPARE",
        $sformatf(
            "TXN=%0d OUT[%0d][%0d] PASS Exp=%0d Act=%0d",
            txn_id,
            i,
            j,
            tr.expected[i][j],
            tr.y[i][j]
        ),
        UVM_LOW
    )

else

    `uvm_error(
        "COMPARE",
        $sformatf(
            "TXN=%0d OUT[%0d][%0d] FAIL Exp=%0d Act=%0d",
            txn_id,
            i,
            j,
            tr.expected[i][j],
            tr.y[i][j]
        )
    )
    end

endfunction
endclass

`endif