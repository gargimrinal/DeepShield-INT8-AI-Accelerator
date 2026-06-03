# RTL Source Files

This directory contains the synthesizable SystemVerilog RTL modules used in the INT8 AI Accelerator.

## Files

* `pe.sv` – Processing Element with MAC operation, overflow detection, and saturation logic.
* `pe_systolic.sv` – Parameterized systolic array architecture.
* `fsm.sv` – Finite State Machine controller.
* `int8_accelerator.sv` – Top-level module integrating the FSM and systolic array.

## Features

* Parameterized design
* Signed INT8 computation
* Saturating arithmetic
* FSM-based control
* Scalable systolic architecture


