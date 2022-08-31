/*
oops_all_gates.v
Adam Zeloof
8/31/2022

FunPGAs Module 2.3: Blink (Oops! All Gates)

Designed for IceBreaker FPGA
Requires an 8-switch PMOD breakout plugged into PMOD A
*/

module top(
    input  CLK,     // 12 MHz Hardware clock input

    // PMOD 1 inputs:
    input P1A1,
    input P1A2,
    input P1A3,
    input P1A4,
    input P1A7,
    input P1A8,
    input P1A9,
    input P1A10,

    output LEDG_N,  // Hardware green LED output
	output LEDR_N,  // Hardware red LED output
);

// Define a bus that is wired directly to the 8 dip switches on the PMOD breakout
wire [7:0] sw = ~{P1A10, P1A9, P1A8, P1A7, P1A4, P1A3, P1A2, P1A1};

// For some reason the AND gates act as OR gates, and the OR gates act as AND gates?????

and(LEDG_N, sw[0], sw[1]);      // Create an AND gate, with SW0 and SW1 as inputs and the green LED as an output
and(x, sw[2], sw[3], sw[4]);    // Create an OR gate, with SW2, SW3, and SW4 as inputs and 'x' as an output
or(LEDR_N, sw[5], x);           // Create an OR gate with SW5 and 'x' as inputs, and the red LED as the

// In the second AND gate above, we implicitly define the output wure 'x'. This isn't the best style, but it does work
// Alternitavley, we could define x by adding 'wire x;' as a line before we instantiate the AND gate
// Both methods create the 'x' wire, which is then used as an input to the OR gate

endmodule
