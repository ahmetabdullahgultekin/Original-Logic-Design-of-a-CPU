module D_Latch_tb;

reg D;
reg CLK;
wire Q;

D_Latch UUT (
  .D(D),
  .CLK(CLK),
  .Q(Q)
);

initial begin
  $monitor("Time=%t D=%b CLK=%b Q=%b", $time, D, CLK, Q);
  
  // Test Case 1: D = 0, CLK = 0
  D = 0;
  CLK = 0;
  #5;
  
  // Test Case 2: D = 1, CLK = 0
  D = 1;
  CLK = 0;
  #5;
  
  // Test Case 3: D = 0, CLK = 1
  D = 0;
  CLK = 1;
  #5;
  
  // Test Case 4: D = 1, CLK = 1
  D = 1;
  CLK = 1;
  #5;
  
  // Test Case
  D = 1;
  CLK = 0;
  #5;
  
  // Test Case 
  D = 0;
  CLK = 0;
  #5;
  
  // Test Case 
  D = 0;
  CLK = 1;
  #5;
  
  // Test Case 
  D = 1;
  CLK = 1;
  #5;
  $finish;
end

endmodule