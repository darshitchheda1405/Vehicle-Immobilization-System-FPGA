# Truth Table

Assuming the design is out of reset:

| SW3 SW2 SW1 SW0 | Meaning | LED output |
|---|---|---|
| `1010` | Correct PIN | `16'hFFFF` |
| Any other 4-bit value | Incorrect PIN | `16'hAAAA` |

When reset is asserted (`BTNC` active-low):

```text
LED[15:0] = 16'h0000
```

`16'hAAAA` corresponds to the repeating binary pattern:

```text
1010_1010_1010_1010
```

This is used as a visible unauthorized indication.
