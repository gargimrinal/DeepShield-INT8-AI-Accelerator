# Verification

This folder contains the complete SystemVerilog and UVM verification environment developed for the **INT8 AI Accelerator**.

## Verification Objectives

* Verify functionality of all RTL modules.
* Validate INT8 MAC arithmetic correctness.
* Verify overflow detection and saturation logic.
* Verify FSM state transitions and control flow.
* Verify data propagation through the systolic array.
* Verify end-to-end functionality of the integrated accelerator.
* Compare DUT outputs against a golden reference model.
* Measure functional coverage of the verification environment.

---

## Verification Methodology

The verification environment was developed in multiple stages:

1. Directed Self-Checking Testbenches
2. Functional Verification of Individual RTL Blocks
3. UVM-Based Verification Environment
4. Golden Reference Model
5. Scoreboard-Based Output Checking
6. Functional Coverage
7. Directed Regression Testing

---

## UVM Components

The UVM verification environment includes:

* Interface
* Sequence Item
* Sequences
* Driver
* Monitor
* Sequencer
* Agent
* Environment
* Scoreboard
* Functional Coverage Collector
* Golden Reference Model
* Test Classes

---

## Verification Results

* All scoreboard comparisons passed successfully.
* Functional Coverage: **92.59%**
* UVM Errors: **0**
* UVM Fatal Errors: **0**

The remaining uncovered functional coverage bins correspond to input combinations and corner cases that were not exercised by the current directed regression suite.

---

## Tools

* SystemVerilog
* Universal Verification Methodology (UVM 1.2)
* Xilinx Vivado 2025.2 (XSim)

---

## Project Status

* ✔ Verification Environment Complete
* ✔ Directed Regression Complete
* ✔ Functional Coverage Implemented
* ✔ Golden Model Verified
* ✔ Self-Checking Scoreboard Implemented
