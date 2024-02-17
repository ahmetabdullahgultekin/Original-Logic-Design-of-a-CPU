module ElevenBitRegister_TB;
  
  // Inputs
  reg [10:0] in;
  reg enable;
  reg clear;
  reg CLK;
  
  // Outputs
  wire [10:0] Q;
  
  // Instantiate the ElevenBitRegister module
  ElevenBitRegister UUT(
    .in(in),
    .enable(enable),
    .clear(clear),
    .CLK(CLK),
    .Q(Q)
  );
  
  // Clock generation
  always begin
    CLK = 0;
    #5;
    CLK = 1;
    #5;
  end
  
  // Test stimulus
  initial begin
    // Test 1: Clear = 1
    clear = 1;
    #10;
    
    // Test 2: Clear = 0, Enable = 0, in = 0
    clear = 0;
    enable = 0;
    in = 11'b1;
    #10;
    
    // Test 3: Clear = 0, Enable = 1, in = 10101010101
    enable = 1;
    in = 11'b10101010101;
    #10;
    
    // Test 4: Clear = 0, Enable = 1, in = 11111111111
    in = 11'b11111111111;
    #10;
    
    // Test 5: Clear = 0, Enable = 1, in = 00000000000
    in = 11'b00000000000;
    #10;
    
    // Test 6: Clear = 1
    clear = 1;
    #10;
    
    $finish;
  end
  
endmodule

