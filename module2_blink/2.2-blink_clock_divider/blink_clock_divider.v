/*
blink_clock_divider.v
Adam Zeloof
8/31/2022

FunPGAs Module 2.2: Blink (Clock Divider)

Designed for IceBreaker FPGA
*/

module top(
    input  CLK,     // 12 MHz Hardware clock input
    output LEDG_N,  // Hardware green LED output
	output LEDR_N,  // Hardware red LED output
);

// The previous method is a great way to easily slow down the clock, but it isn't perfect
// The clock can only be slowed down by factors of 2^n
// To allow for more adjustment, we design a clock divider

wire slow_clk;

clock_divider divider(
    .clk(CLK),
    .div(24'd6000000),
    .slow_clk(slow_clk)
);

// Not only does this method let us select nearly any lower frequency,
// it also allows the clock speed to be adjusted on the fly

assign LEDG_N = slow_clk;    // Wire the green LED to the MSB of 'counter'
assign LEDR_N = ~slow_clk;   // Wire the red LED to the inverse of the MSB of 'counter'


endmodule
