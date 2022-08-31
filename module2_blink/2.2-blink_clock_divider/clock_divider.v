/*
clock_divider.v
Adam Zeloof
8/31/2022
*/

module clock_divider(
    input clk,          // External clock input
    input [23:0] div,   // Division factor (div = f_clk/(2*f_desired))
    output slow_clk,    // slowed-down clock to output
);

reg [23:0] counter;
reg slow_clk;

always @(posedge clk) begin
    counter <= counter + 1;
    if (counter >= div) begin
        counter <= 0;
        slow_clk = ~slow_clk;
    end
end

endmodule