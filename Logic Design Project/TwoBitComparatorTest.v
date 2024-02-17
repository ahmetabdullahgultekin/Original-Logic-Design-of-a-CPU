
module TwoBitComparatorTest;
  
  reg [1:0] A, B;
  reg isEqual, isGreater, isLess;
  wire equal, A_greater, A_less;
  
  TwoBitComparator uut (
    .A(A),
    .B(B),
    .isEqual(isEqual),
    .isGreater(isGreater),
    .isLess(isLess),
    .equal(equal),
    .A_greater(A_greater),
    .A_less(A_less)
  );
  
  initial begin
    $monitor("A=%b, B=%b, isEqual=%b, isGreater=%b, isLess=%b, equal=%b, A_greater=%b, A_less=%b", A, B, isEqual, isGreater, isLess, equal, A_greater, A_less);
    
    // Test case 1: A = 00, B = 00
    A = 2'b00;
    B = 2'b00;
    isEqual = 1;
    isGreater = 0;
    isLess = 0;
    #10;
    
    // Test case 2: A = 10, B = 01
    A = 2'b10;
    B = 2'b01;
    isEqual = 0;
    isGreater = 1;
    isLess = 0;
    #10;
    
    // Test case 3: A = 01, B = 10
    A = 2'b01;
    B = 2'b10;
    isEqual = 0;
    isGreater = 0;
    isLess = 1;
    #10;
    
    // Test case 4: A = 11, B = 11
    A = 2'b11;
    B = 2'b11;
    isEqual = 1;
    isGreater = 0;
    isLess = 0;
    #10;
    
    // Additional test cases can be added here
    
    $finish;
  end

endmodule
