# Version Reconciliation

## Why this document exists

The supplied project materials contain two related but not fully identical descriptions of the design.

### Academic report

The report describes:

- a vehicle immobilization system using an FSM
- PIN `1010`
- a confirmation button
- verification states
- an attempt counter / maximum-attempt concept
- LED responses
- physical implementation on the Nexys 4 DDR

The report's methodology says BTNC is used as an enter/confirm button.

### Supplied RTL/XDC

The supplied `TopModule` declares:

```verilog
input [3:0] sw;
input clk;
input btnC;
output [15:0] led;
```

and connects:

```verilog
.reset(btnC)
```

The supplied XDC also assigns `btnC` to the center-button package pin as the reset signal. No separate confirmation button is exposed.

## Final repository decision

For a public GitHub repository, the final RTL should not claim an interface that the supplied constraints do not implement.

The final implementation therefore uses:

- SW0–SW3 → PIN input
- `1010` → authorized LED pattern
- other values → unauthorized LED pattern
- BTNC → active-low reset

This is a deliberate cleanup/reconciliation step, not an attempt to hide the earlier version.

## Original source preservation

The original academic report is retained in `docs/academic_report.pdf`.

The final cleaned RTL is in `rtl/`.

This lets a reviewer see both the original academic submission and the hardware-compatible version.
