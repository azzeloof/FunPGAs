/*
blink.v
Adam Zeloof
8/31/2022

FunPGAs Module 2.1: Blink (blink)

Designed for IceBreaker FPGA
*/

module top(         // By convention, the top-level module is callde 'top'
    input  CLK,     // 12 MHz Hardware clock input
    output LEDG_N,  // Hardware green LED output
	output LEDR_N,  // Hardware red LED output
);

// The clock is really fast, so we need to slow it down
// (12,000,000 Hz) / (2^23) = 1.4 Hz

reg [23:0] counter;             // Instantiate a 24-bit wide register
assign LEDG_N = counter[23];    // Wire the green LED to the MSB of 'counter'
assign LEDR_N = ~counter[23];   // Wire the red LED to the inverse of the MSB of 'counter'


always @(posedge CLK) begin
	counter <= counter + 1;     // Every clock cycle, increment the counter
end

endmodule
