module EighteenBitRegister (
 input [17:0] in,
 input enable,
 input clear,
 input CLK,
 output reg [17:0] Q
);

wire [17:0] out;
/*
FlipFlop a(.D(in[0] & enable), .CLK(CLK), .Q(out[0]));
FlipFlop b(.D(in[1] & enable), .CLK(CLK), .Q(out[1]));
FlipFlop c(.D(in[2] & enable), .CLK(CLK), .Q(out[2]));
FlipFlop d(.D(in[3] & enable), .CLK(CLK), .Q(out[3]));
FlipFlop e(.D(in[4] & enable), .CLK(CLK), .Q(out[4]));
FlipFlop f(.D(in[5] & enable), .CLK(CLK), .Q(out[5]));
FlipFlop g(.D(in[6] & enable), .CLK(CLK), .Q(out[6]));
FlipFlop h(.D(in[7] & enable), .CLK(CLK), .Q(out[7]));
FlipFlop i(.D(in[8] & enable), .CLK(CLK), .Q(out[8]));
FlipFlop j(.D(in[9] & enable), .CLK(CLK), .Q(out[9]));
FlipFlop k(.D(in[10] & enable), .CLK(CLK), .Q(out[10]));
FlipFlop m(.D(in[11] & enable), .CLK(CLK), .Q(out[11]));
FlipFlop n(.D(in[12] & enable), .CLK(CLK), .Q(out[12]));
FlipFlop o(.D(in[13] & enable), .CLK(CLK), .Q(out[13]));
FlipFlop p(.D(in[14] & enable), .CLK(CLK), .Q(out[14]));
FlipFlop q(.D(in[15] & enable), .CLK(CLK), .Q(out[15]));
FlipFlop r(.D(in[16] & enable), .CLK(CLK), .Q(out[16]));
FlipFlop s(.D(in[17] & enable), .CLK(CLK), .Q(out[17]));
*/
always @(posedge CLK) begin
 if (clear)
  Q <= 18'b0;
 else if (enable)
  Q <= in;
end
endmodule
