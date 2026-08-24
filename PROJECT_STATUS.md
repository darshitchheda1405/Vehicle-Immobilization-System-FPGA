# Project Status

## Final repository scope

This repository is based on the files supplied for the Vehicle Immobilization System and the behavior that can be made consistent with the supplied top-level RTL and XDC.

### Included and grounded

- Nexys 4 DDR FPGA platform
- Verilog RTL
- Four switch PIN input
- PIN `1010`
- BTNC used as active-low reset in the supplied XDC/top-level connection
- Sixteen LED outputs
- Correct PIN → all LEDs ON
- Incorrect PIN → alternate LEDs ON
- Academic report and its implementation photographs

## Important reconciliation

The academic report contains a more elaborate description involving a confirmation button, FSM states, and an attempt counter. The uploaded XDC maps BTNC to `btnC`, while the uploaded top-level module maps `btnC` to `reset`. There is no separate confirmation-button port in the supplied XDC.

Therefore, the final public RTL in this repository follows the **hardware interface actually provided by the uploaded XDC/top-level design**, and the difference is documented instead of being hidden.

## Not claimed

- A production automotive immobilizer
- Real vehicle integration
- A complete attempt-lockout mechanism in the final RTL
- Independent re-testing of the original physical prototype beyond the evidence contained in the academic report
