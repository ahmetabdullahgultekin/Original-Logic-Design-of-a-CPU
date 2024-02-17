module FullAdder(input A, input B, input Ci, output S, output Co);
 assign Co = (A & B) | (A & Ci) | (B & Ci);
 assign S = (A ^ B) ^ Ci;
endmodule
