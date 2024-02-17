module FourBitRegister (
 input [3:0] in,
 input enable,
 input clear,
 input CLK,
 output reg [3:0] Q
);

wire [3:0] out;

/*FlipFlop first(.D(in[0] & enable), .CLK(CLK), .Q(out[0]));
FlipFlop second(.D(in[1] & enable), .CLK(CLK), .Q(out[1]));
FlipFlop third(.D(in[2] & enable), .CLK(CLK), .Q(out[2]));
FlipFlop fourth(.D(in[3] & enable), .CLK(CLK), .Q(out[3]));*/

always @(posedge CLK) begin
 if (clear)
  Q <= 4'b0;
 else if (enable)
  Q <= in;
end
endmodule