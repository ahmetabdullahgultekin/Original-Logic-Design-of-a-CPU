module signExtender_testbench;
  
  // Inputs
  reg [5:0] sixBit;
  
  // Outputs
  wire [17:0] eighteenBit;
  
  // Instantiate the signExtender module
  signExtender DUT(.sixBit(sixBit), .eighteenBit(eighteenBit));
  
  // Clock signal for simulation
  reg clk;
  always #5 clk = ~clk;
  
  // Testbench code
  initial begin
    // Initialize inputs
    sixBit = 6'b010101;
    clk = 0;
    
    // Wait for the output to stabilize
    #10;
    
    // Display the output value
    $display("sixBit = %b, eighteenBit = %b", sixBit, eighteenBit);
    
    // Change the input to a different value
    sixBit = 6'b101010;
    // Wait for the output to stabilize
    #10;
    
    // Display the new output value
    $display("sixBit = %b, eighteenBit = %b", sixBit, eighteenBit);
    
    // End the simulation
    $finish;
  end
endmodule