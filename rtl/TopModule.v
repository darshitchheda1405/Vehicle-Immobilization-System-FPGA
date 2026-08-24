module TopModule (
    input  [3:0]  sw,       // PIN input: SW3..SW0
    input         clk,
    input         btnC,     // Active-low reset on Nexys 4 DDR
    output [15:0] led
);

    LockSystem lock_system (
        .pin_input(sw),
        .clk(clk),
        .reset(btnC),
        .leds(led)
    );

endmodule
