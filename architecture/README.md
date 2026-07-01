# Documentation

This directory contains project documentation and architecture references.

## Contents

* Architecture diagrams
* Design notes
* Project overview
* System-level block diagrams
* Verification flow

## Accelerator Overview

The INT8 AI Accelerator consists of:

1. FSM Controller
2. Processing Elements
3. Systolic MAC Array
4. Top-Level Integration Module
5. Uvm verification flow

The controller manages accelerator execution through the following sequence:

IDLE → LOAD → COMPUTE → DONE
