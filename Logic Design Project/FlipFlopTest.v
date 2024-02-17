module FlipFlop_tb;
  reg D;
  reg CLK;
  wire Q;

  FlipFlop uut(.D(D), .CLK(CLK), .Q(Q));
  
  // Clock signal generation
  always #5 CLK = ~CLK;
  
  // Stimulus generation
  initial begin
    D = 0;
    CLK = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 $finish;
  end
  
  // Monitor
  always @(posedge CLK) begin
    $display("Q = %b", Q);
  end
  
endmodule

