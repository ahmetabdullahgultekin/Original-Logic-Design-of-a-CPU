module OneBitRegister_Test;

  // Inputs
  reg in;
  reg enable;
  reg clear;
  reg CLK;
  
  // Outputs
  wire Q;
  
  // Instantiate the module under test
  OneBitRegister dut (
    .in(in),
    .enable(enable),
    .clear(clear),
    .CLK(CLK),
    .Q(Q)
  );
  
  // Clock generation
  always #5 CLK = ~CLK;
  
  // Initialize inputs
  initial begin
    in = 0;
    enable = 0;
    clear = 0;
    CLK = 0;
    
    // Test scenario 1
    #10 in = 1;  // Set input to 1
    #10 enable = 1;  // Set enable to 1
    #10 clear = 0;  // Set clear to 0
    #10 clear = 1;  // Set clear to 1
    #10 clear = 0;  // Set clear to 0
    
    // Test scenario 2
    #10 in = 0;  // Set input to 0
    #10 enable = 1;  // Set enable to 1
    #10 clear = 0;  // Set clear to 0
    
    // Test scenario 3
    #10 in = 1;  // Set input to 1
    #10 enable = 0;  // Set enable to 0
    #10 clear = 0;  // Set clear to 0
    
    // Test scenario 4
    #10 in = 1;  // Set input to 1
    #10 enable = 1;  // Set enable to 1
    #10 clear = 0;  // Set clear to 0
    
    // Test scenario 5
    #10 in = 0;  // Set input to 0
    #10 enable = 0;  // Set enable to 0
    #10 clear = 1;  // Set clear to 1
    
    // Test scenario 6
    #10 in = 1;  // Set input to 1
    #10 enable = 1;  // Set enable to 1
    #10 clear = 0;  // Set clear to 1
    
    // Test scenario 7
    #10 in = 0;  // Set input to 0
    #10 enable = 0;  // Set enable to 0
    #10 clear = 0;  // Set clear to 0
    
    // Add more test scenarios if needed
    // ...
    
    // Terminate simulation
    $finish;
  end
  
endmodule
