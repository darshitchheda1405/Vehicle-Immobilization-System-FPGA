# Vehicle Immobilization System — Portfolio Report

## 1. Overview

The Vehicle Immobilization System is a digital security prototype implemented on a Nexys 4 DDR FPGA. The project explores PIN-based authorization, state-oriented digital control, and visible access-status indication.

The academic report identifies the project as a mini project in the Digital System Design laboratory during Aug–Dec 2024 and lists Darshit Chheda as one of the three team members.

## 2. Hardware

- Digilent Nexys 4 DDR FPGA development board
- Four user switches for PIN input
- Center push button for reset in the supplied hardware constraints
- Sixteen user LEDs for status output
- USB programming connection

## 3. Final hardware-compatible interface

The supplied XDC and top-level RTL expose:

```text
sw[3:0] → PIN input
btnC    → active-low reset
led[15:0] → status
clk     → board clock
```

The predefined PIN is `1010`.

## 4. Final RTL behavior

The cleaned RTL compares the four switch inputs against `1010`.

- Correct PIN: `16'hFFFF`
- Other PIN: `16'hAAAA`
- Reset: `16'h0000`

This produces a simple, visible authorization/denial demonstration.

## 5. Relationship to the academic report

The original report describes a broader FSM/attempt-count design and uses BTNC as a confirmation control in its methodology. The supplied top-level and XDC instead use BTNC as reset. This portfolio repository explicitly documents the discrepancy rather than presenting both interfaces as if they were the same implementation.

## 6. Team contribution

The original report records:

- Pisupati Rama Sridhrut — Verilog code
- Satwik Abhay — documentation and system design
- Darshit Chheda — testing and debugging

## 7. Evidence

The original report contains implementation photographs for locked and unlocked states. The report itself is preserved in the repository.

## 8. Limitations

This is an FPGA laboratory prototype. It is not an automotive-grade immobilization system and should not be connected to a real vehicle.

## 9. References

The original report references the Digilent Nexys 4 DDR reference manual and a Verilog debouncing reference.
