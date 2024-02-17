module signExtender(
  input [5:0] sixBit,
  output [17:0] eighteenBit
);
  
  assign eighteenBit[17:6] = (sixBit[5]) ? {12'b1111_1111_1111} : {12'b0000_0000_0000};
  assign eighteenBit[5:0] = sixBit;
  
endmodule