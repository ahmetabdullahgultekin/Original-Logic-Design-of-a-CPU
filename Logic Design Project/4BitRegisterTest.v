module FourBitRegister_Test;

  // Inputs
  reg [3:0] in;
  reg enable;
  reg clear;
  reg CLK;

  // Outputs
  wire [3:0] Q;

  // Instantiate the module under test
  FourBitRegister dut (
    .in(in),
    .enable(enable),
    .clear(clear),
    .CLK(CLK),
    .Q(Q)
  );

  // Clock generation
  always #5 CLK = ~CLK;  // Toggle CLK every 5 time units

  // Initialize inputs
  initial begin
    in = 0;
    enable = 0;
    clear = 0;
    CLK = 0;

    // Test scenarios (add more as needed)
    #10 in = 4'b1100; enable = 1; clear = 0;  // Set input, enable, no clear
    #10 in = 4'b0011; enable = 1; clear = 0;  // Change input, enable, no clear
    #10 clear = 1;                           // Clear the register
    #10 clear = 0;                           // Release clear
    #10 enable = 0;                           // Disable updates
    #10 in = 4'b1010;                       // Change input (should have no effect)
    #10 enable = 1;                           // Re-enable updates
    #10 in = 4'b0101;                       // Change input again

    // Terminate simulation
    $finish;
  end

endmodule

