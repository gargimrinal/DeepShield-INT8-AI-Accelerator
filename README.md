# INT8-AI-Accelerator

A parameterized SystemVerilog implementation of an INT8 AI accelerator based on a systolic-array architecture.

## Features

* INT8 Multiply-Accumulate (MAC) Processing Element
* Saturation Arithmetic
* Overflow Detection
* Parameterized Systolic Array Architecture
* 2×2 and 4×4 Array Configurations
* FSM-Based Control Unit
* Top-Level Accelerator Integration
* Functional Verification Using Vivado Simulation

## Architecture

The design consists of:

1. Processing Element (PE)
2. Systolic MAC Array
3. FSM Controller
4. Top-Level INT8 Accelerator

The FSM controls accelerator execution through:

IDLE → LOAD → COMPUTE → DONE

## RTL Modules

### pe.sv

Processing Element containing:

* MAC operation
* Accumulation
* Overflow detection
* Saturation logic

### pe_systolic.sv

Parameterized systolic array implementation supporting configurable ROWS and COLS.

### fsm.sv

Finite State Machine controller for accelerator operation.

### int8_accelerator.sv

Top-level module integrating:

* FSM controller
* 4×4 systolic array

## Verification

Directed testbenches were developed for:

* Processing Element
* 2×2 Systolic Array
* 4×4 Systolic Array
* FSM Controller
* Top-Level Accelerator

Simulation was performed using Xilinx Vivado.

## Tools

* SystemVerilog
* Xilinx Vivado 2025.2

## Future Improvements

* Functional Coverage
* SystemVerilog Assertions (SVA)
* APB Interface Integration
* UVM-Based Verification Environment
