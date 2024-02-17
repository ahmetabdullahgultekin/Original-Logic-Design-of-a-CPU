
module EighteenBitRegister_tb;

  // Inputs
  reg [17:0] in;
  reg enable, clear, CLK;
  
  // Outputs
  wire [17:0] Q;
  
  // Instantiate the EighteenBitRegister module
  EighteenBitRegister dut (
    .in(in),
    .enable(enable),
    .clear(clear),
    .CLK(CLK),
    .Q(Q)
  );
  
  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end
  
  // Stimulus process
  initial begin
    // Initialize inputs
    in = 18'b0;
    enable = 1'b0;
    clear = 1'b0;
    CLK = 1'b0;
    
    // Apply stimulus
    #10 enable = 1'b1;
    #20 in = 18'b101010101010101010; // Input value to be stored
    #10 clear = 1'b1;
    #10 clear = 1'b0;
    #20 clear = 1'b1;
    #20 in = 18'b111100001111000011; // Another input value to be stored
    #10 clear = 1'b1;
    #10 clear = 1'b0;
    #20 in = 18'b010101010101010101; // Third input value to be stored
    #10 clear = 0'b1;
    #10 clear = 0'b0;
    #30 enable = 1'b0;
    #20 enable = 1'b1;
    #30 enable = 1'b0;
    
    // Stop simulation
    $finish;
  end
  
  // Monitor process
  always @(posedge CLK) begin
    $display("Q = %b", Q);
  end

endmodule
