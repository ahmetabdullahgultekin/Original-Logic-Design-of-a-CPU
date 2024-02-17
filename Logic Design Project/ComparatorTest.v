module Comparator_tb;

reg [17:0] CMP1;
reg [17:0] CMP2;
reg CMPsignal;
reg clk;
reg clear;
wire ZF;
wire CF;

Comparator dut(
  .CMP1(CMP1),
  .CMP2(CMP2),
  .CMPsignal(CMPsignal),
  .clk(clk),
  .clear(clear),
  .ZF(ZF),
  .CF(CF)
);

initial begin
  // Initialize inputs
  CMP1 = 18'b0;
  CMP2 = 18'b0;
  CMPsignal = 1'b1;
  clk = 1'b0;
  clear = 1'b0;

  // Apply stimulus
  #10 CMP1 = 18'b101010101010101010; // Set CMP1 to some value
  #10 CMP2 = 18'b010101010101010101; // Set CMP2 to some value
  #10 CMPsignal = 1'b1; // Enable CMPsignal
  #20 CMP1 = 18'b111111111111111111; // Set CMP1 to some other value
  #10 CMPsignal = 1'b0;
      CMP1 = 18'b0;
#10 CMPsignal = 1'b1;
CMP2 = 18'b1;
clear = 1'b0;
#10 CMPsignal = 1'b0;

 // Disable CMPsignal

  // Add additional test cases here

  #100 $finish;
end

// Clock generation
always begin
  #5 clk = ~clk;
end

endmodule

