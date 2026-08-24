# FPGA Vehicle Immobilization System

A hardware-oriented digital security prototype implemented on the **Digilent Nexys 4 DDR FPGA**. The project demonstrates PIN-based access logic using four board switches and a reset-controlled LED status interface.

> **Portfolio note:** The repository separates the original academic report from the final hardware-compatible RTL reconstruction. This is intentional because the uploaded report describes a richer FSM/attempt-count concept, while the supplied XDC exposes only four switches, the center button, and sixteen LEDs.

## Project at a glance

| Item | Implementation |
|---|---|
| FPGA board | Digilent Nexys 4 DDR |
| FPGA | Xilinx Artix-7 XC7A100T |
| HDL | Verilog |
| Tool flow | Xilinx Vivado |
| PIN input | SW0–SW3 |
| PIN | `1010` |
| Reset | BTNC, active-low |
| Output | LED0–LED15 |
| Authorized indication | All 16 LEDs ON |
| Unauthorized indication | Alternate LEDs ON (`16'hAAAA`) |

## How it works

1. The four switches represent a 4-bit PIN.
2. The design compares the switch value with the predefined PIN `1010`.
3. When the correct PIN is present, all sixteen LEDs are asserted.
4. For another PIN value, alternate LEDs are asserted as an unauthorized indication.
5. Pressing/holding the center button activates the active-low reset and clears the LED output.

### Block-level view

```text
             SW3..SW0
                │
                ▼
        ┌─────────────────┐
        │  PIN Comparator  │
        │   PIN = 1010     │
        └────────┬────────┘
                 │
       ┌─────────┴─────────┐
       │                   │
    Correct              Other
       │                   │
       ▼                   ▼
  16'hFFFF             16'hAAAA
       │                   │
       └─────────┬─────────┘
                 ▼
             LED[15:0]

        BTNC ──► Active-low reset
```

## Repository structure

```text
Vehicle-Immobilization-System-FPGA/
├── README.md
├── PROJECT_STATUS.md
├── LICENSE
├── .gitignore
├── rtl/
│   ├── TopModule.v
│   └── LockSystem.v
├── constraints/
│   └── Nexys4DDR.xdc
├── docs/
│   ├── academic_report.pdf
│   ├── portfolio_report.md
│   ├── reconciliation.md
│   ├── truth_table.md
│   └── resume_project_summary.md
├── images/
│   ├── locked_state.png
│   └── unlocked_state.png
└── verification/
    └── test_cases.md
```

## Why the repository contains a reconciliation note

The original report states that BTNC is used as an enter/confirm button and describes a two-state verification concept plus attempt counting. The supplied XDC, however, assigns BTNC as reset and provides no separate confirmation input. The uploaded top-level RTL also connects `btnC` to the `reset` port.

Rather than silently mixing these versions, this repository uses the **uploaded hardware interface as the source of truth for the final RTL package** and documents the difference in `docs/reconciliation.md`.

## Running in Vivado

1. Create a new RTL project.
2. Select the Nexys 4 DDR / Artix-7 XC7A100T device or matching board part.
3. Add:
   - `rtl/TopModule.v`
   - `rtl/LockSystem.v`
   - `constraints/Nexys4DDR.xdc`
4. Set `TopModule` as the top module.
5. Run synthesis.
6. Run implementation.
7. Generate the bitstream.
8. Program the Nexys 4 DDR through JTAG.

## Suggested hardware checks

- Set switches to `1010` and verify the authorized LED pattern.
- Set switches to another value and verify the alternate LED pattern.
- Assert BTNC and verify the LED output clears.
- Repeat with several switch combinations.

## Evidence

The original academic report contains photographs labelled **Locked state** and **Unlocked State** on pages 9 and 10. These are preserved under `images/` and the original report is preserved under `docs/`.

## Scope and limitations

This repository is a digital prototype, not a complete automotive immobilizer. It demonstrates the access-control logic on an FPGA board and should not be connected to a real vehicle ignition or safety-critical system.

## Author

**Darshit Chheda**  
Electrical & Electronics Engineering
