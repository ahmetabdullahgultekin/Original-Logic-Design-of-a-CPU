module FourBitComparator(
    input [3:0] A, B,
    input isEqual, isGreater, isLess,
    output reg equal,
    output reg A_greater,
    output reg A_less
);

wire [1:0] eq, gre, less;

TwoBitComparator firstComp(.A(A[1:0]), .B(B[1:0]), .isEqual(isEqual), .isGreater(isGreater), .isLess(isLess), .equal(eq[0]), .A_greater(gre[0]), .A_less(less[0]));
TwoBitComparator secondComp(.A(A[3:2]), .B(B[3:2]), .isEqual(eq[0]), .isGreater(gre[0]), .isLess(less[0]), .equal(eq[1]), .A_greater(gre[1]), .A_less(less[1]));

   assign equal = eq[1];

always @(*) begin
    if (eq[1]) begin
        A_greater = 0;
        A_less = 0;
    end 
    else begin
        if (gre[1]) begin
            A_greater = 1;
            A_less = 0;
        end else begin
            A_greater = 0;
            A_less = 1;
        end
    end
end

endmodule
