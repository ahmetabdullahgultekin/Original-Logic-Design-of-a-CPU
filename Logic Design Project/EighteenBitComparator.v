module EighteenBitComparator(
    input [17:0] A, B,
    output reg equal,
    output reg A_greater,
    output reg A_less
);

wire [4:0] eq, gre, less;

FourBitComparator firstComp(.A(A[3:0]), .B(B[3:0]), .isEqual(1'b1), .isGreater(1'b0), .isLess(1'b0), .equal(eq[0]), .A_greater(gre[0]), .A_less(less[0]));
FourBitComparator secondComp(.A(A[7:4]), .B(B[7:4]), .isEqual(eq[0]), .isGreater(gre[0]), .isLess(less[0]), .equal(eq[1]), .A_greater(gre[1]), .A_less(less[1]));
FourBitComparator thirdComp(.A(A[11:8]), .B(B[11:8]), .isEqual(eq[1]), .isGreater(gre[1]), .isLess(less[1]), .equal(eq[2]), .A_greater(gre[2]), .A_less(less[2]));
FourBitComparator fourthComp(.A(A[15:12]), .B(B[15:12]), .isEqual(eq[2]), .isGreater(gre[2]), .isLess(less[2]), .equal(eq[3]), .A_greater(gre[3]), .A_less(less[3]));
TwoBitComparator fifthComp(.A(A[17:16]), .B(B[17:16]), .isEqual(eq[3]), .isGreater(gre[3]), .isLess(less[3]), .equal(eq[4]), .A_greater(gre[4]), .A_less(less[4]));

   assign equal = eq[4];

always @(*) begin
    if (eq[4]) begin
        A_greater = 0;
        A_less = 0;
    end 
    else begin
        if (gre[4]) begin
            A_greater = 1;
            A_less = 0;
        end else begin
            A_greater = 0;
            A_less = 1;
        end
    end
end

endmodule
