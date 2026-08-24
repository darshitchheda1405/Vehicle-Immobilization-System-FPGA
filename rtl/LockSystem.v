module LockSystem #(
    parameter [3:0] PREDEFINED_PIN = 4'b1010
) (
    input  wire       clk,
    input  wire       reset,       // Active-low reset
    input  wire [3:0] pin_input,
    output reg [15:0] leds
);

    // Hardware-compatible behavior used by the submitted top-level design:
    // - Reset places the system in the locked/idle indication.
    // - PIN 1010 produces an "authorized" indication: all LEDs ON.
    // - Any other PIN produces an "unauthorized" indication: alternate LEDs ON.
    //
    // The uploaded XDC provides SW0-SW3 and BTNC only; therefore BTNC is kept
    // as reset and no separate confirmation-button input is assumed here.

    localparam [15:0] LED_OFF        = 16'b0;
    localparam [15:0] LED_AUTHORIZED = 16'hFFFF;
    localparam [15:0] LED_DENIED     = 16'hAAAA;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            leds <= LED_OFF;
        end else if (pin_input == PREDEFINED_PIN) begin
            leds <= LED_AUTHORIZED;
        end else begin
            leds <= LED_DENIED;
        end
    end

endmodule
