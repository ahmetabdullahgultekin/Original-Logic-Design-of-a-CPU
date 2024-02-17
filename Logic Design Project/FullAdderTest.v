
module FullAdder_TB;
  // Inputs
  reg A, B, Ci;
  // Outputs
  wire S, Co;
  
  // Instantiate FullAdder module
  FullAdder DUT (
    .A(A),
    .B(B),
    .Ci(Ci),
    .S(S),
    .Co(Co)
  );
  
  // Clock generation
  reg clk;
  always #5 clk = ~clk;
  
  // Test stimulus
  initial begin
    // Test case 1
    #10 A = 0; B = 0; Ci = 0;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 2
    #10 A = 0; B = 1; Ci = 0;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 3
    #10 A = 1; B = 0; Ci = 0;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 4
    #10 A = 1; B = 1; Ci = 0;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 5
    #10 A = 0; B = 0; Ci = 1;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 6
    #10 A = 0; B = 1; Ci = 1;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 7
    #10 A = 1; B = 0; Ci = 1;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // Test case 8
    #10 A = 1; B = 1; Ci = 1;
    #10 $display("A=%b, B=%b, Ci=%b, S=%b, Co=%b", A, B, Ci, S, Co);
    
    // End simulation
    #10 $finish;
  end
  
  // Clock driver
  always #2 clk = ~clk;
  
endmodule
