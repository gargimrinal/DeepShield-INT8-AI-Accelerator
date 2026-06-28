# INT8 AI Accelerator with UVM Verification

A parameterized SystemVerilog implementation of an INT8 AI Accelerator based on a 4×4 systolic array architecture, accompanied by a complete UVM verification environment featuring a reference model, scoreboard, functional coverage, and regression testing.

---

## Project Overview

This project implements a configurable INT8 matrix multiplication accelerator intended for AI inference workloads. The accelerator uses a systolic array of Processing Elements (PEs) controlled by an FSM-based controller. A complete UVM testbench was developed to verify the RTL against a golden reference model.

---

## Features

### RTL Design

* Parameterized INT8 Multiply-Accumulate (MAC) Processing Element
* Saturation Arithmetic
* Overflow Detection
* Parameterized Systolic Array Architecture
* 2×2 and 4×4 Array Implementations
* FSM-Based Accelerator Controller
* Top-Level INT8 Accelerator Integration

### UVM Verification

* UVM Agent
* Driver
* Monitor
* Sequencer
* Environment
* Scoreboard
* Functional Coverage
* Golden Reference Model
* Directed Test Sequences
* Regression Testing

---

## RTL Architecture

The accelerator consists of the following blocks:

* Processing Element (PE)
* Systolic MAC Array
* FSM Controller
* Top-Level INT8 Accelerator

The controller operates through the following states:

```
IDLE → LOAD → COMPUTE → DONE
```

---

## RTL Modules

### pe.sv

Implements the INT8 Processing Element containing:

* Multiply-Accumulate (MAC)
* Accumulator
* Overflow Detection
* Saturation Logic

### pe_systolic.sv

Parameterized systolic array implementation supporting configurable array dimensions.

### fsm.sv

Finite State Machine controlling accelerator execution.

### int8_accelerator.sv

Top-level integration of:

* FSM Controller
* 4×4 Systolic Array

---

## Verification Environment

The RTL is verified using a UVM-based constrained verification environment consisting of:

* Interface
* Sequence Item
* Sequences
* Driver
* Monitor
* Sequencer
* Agent
* Environment
* Scoreboard
* Functional Coverage
* Golden Model
* Test Classes

The scoreboard compares DUT outputs against the golden model for every transaction, ensuring functional correctness throughout regression.

---

## Functional Coverage

Coverage model includes:

* Positive, Negative and Zero input values
* Extreme INT8 values (-128 and +127)
* Output value classification
* Cross coverage between input operands

### Verification Results

* Functional Coverage: **92.59%**
* Scoreboard Comparisons: **416 / 416 Passed**
* UVM Errors: **0**
* UVM Fatal Errors: **0**

The remaining uncovered bins correspond to input combinations and corner cases that were not exercised by the current directed regression suite.

---

## Verification Strategy

The project was verified using:

* Directed Tests
* Regression Sequences
* Functional Coverage
* Self-checking Scoreboard

---

## Tools

* SystemVerilog
* Universal Verification Methodology (UVM 1.2)
* Xilinx Vivado 2025.2 (XSim)



