# Verification Cases

These are the checks supported by the final RTL interface.

| Test | Input | Expected |
|---|---|---|
| Reset | BTNC asserted | All LEDs OFF |
| Correct PIN | SW = `1010` | All LEDs ON |
| Incorrect PIN 1 | SW = `0000` | Alternate LEDs |
| Incorrect PIN 2 | SW = `1111` | Alternate LEDs |
| Incorrect PIN 3 | SW = `0101` | Alternate LEDs |

## Evidence note

The original academic report includes physical implementation photographs labelled "Locked state" and "Unlocked State" on pages 9–10. Those photographs are preserved as project evidence; this file does not claim that the above verification was independently repeated in the current session.
