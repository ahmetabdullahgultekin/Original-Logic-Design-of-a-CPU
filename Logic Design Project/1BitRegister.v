module OneBitRegister (
 input in,
 input CLK,
 input clear,
 input enable,
 output reg Q
);

wire  out;

//FlipFlop first(.D(in), .CLK(CLK), .Q(out));

always @(posedge CLK) begin

 if (clear == 1)begin
  Q <= 1'b0;
end
 else if (enable)begin
  Q <= in;
end
end

endmodule