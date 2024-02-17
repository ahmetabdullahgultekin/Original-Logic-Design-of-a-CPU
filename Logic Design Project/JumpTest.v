module Jump_Test();
  
  // Signals
  reg jumpSignal;
  reg [2:0] IR;
  reg [10:0] PC;
  reg [10:0] Address;
  reg ZF;
  reg CF;
  wire [10:0] jumpAddress;
  
  // Instantiate module
  Jump jump(.jumpSignal(jumpSignal), .IR(IR), .PC(PC), .Address(Address), .ZF(ZF), .CF(CF), .jumpAddress(jumpAddress));
  
  // Initial values
  initial begin
    jumpSignal = 0;
    IR = 3'b000;
    PC = 11'b00000000000;
    Address = 11'b00000000001;
    ZF = 0;
    CF = 1;
    
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
    
    // Update inputs
    jumpSignal = 1;
    IR = 3'b001;
    PC = 11'b00000000011;
    Address = 11'b00000000001;
#5;
    ZF = 1;
    CF = 0;
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
    
    // Update inputs
    jumpSignal = 1;
    IR = 3'b010;
    PC = 11'b00000010000;
    Address = 11'b01000000001;
    #5;
    ZF = 0;
    CF = 0;
#5;
    ZF = 1;
    CF = 1;
    
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
  
    // Update inputs
    jumpSignal = 1;
    IR = 3'b011;
    PC = 11'b00000010000;
    Address = 11'b01000000001;
    #5;
    ZF = 0;
    CF = 1;
    
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
    
    // Update inputs
    jumpSignal = 1;
    IR = 3'b100;
    PC = 11'b00000000001;
    Address = 11'b00000000110;
    #5;
    ZF = 0;
    CF = 0;
#5;
    ZF = 1;
    CF = 0;
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
  
    // Update inputs
    jumpSignal = 1;
    IR = 3'b101;
    PC = 11'b00000010000;
    Address = 11'b01000000001;
    #5;
    ZF = 0;
    CF = 0;
#5;
    ZF = 0;
    CF = 1;
#5;
    ZF = 1;
    CF = 1;
    
    // Wait for some time to observe the output
    #10;
    
    // Print output
    $display("Jump Address: %d", jumpAddress);
  end
endmodule

