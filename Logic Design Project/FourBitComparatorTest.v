module FourBitComparator_Test;

reg [3:0] A, B;
reg isEqual, isGreater, isLess;
wire equal, A_greater, A_less;

FourBitComparator dut(
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
A = 4'b0000;
B = 4'b0000;
isEqual = 1;
isGreater = 0;
isLess = 0;
#10;

A = 4'b0101;
B = 4'b0101;
isEqual = 0;
isGreater = 1;
isLess = 0;
#10;

A = 4'b1010;
B = 4'b1010;
isEqual = 0;
isGreater = 0;
isLess = 1;
#10;

A = 4'b1100;
B = 4'b0011;
isEqual = 0;
isGreater = 0;
isLess = 0;
#10;

A = 4'b1111;
B = 4'b0110;
isEqual = 0;
isGreater = 0;
isLess = 1;
#10;

A = 4'b1111;
B = 4'b1100;
isEqual = 1;
isGreater = 0;
isLess = 0;
#10;

A = 4'b1111;
B = 4'b1100;
isEqual = 0;
isGreater = 1;
isLess = 0;
#10;

A = 4'b0011;
B = 4'b1100;
isEqual = 1;
isGreater = 0;
isLess = 0;
#10;

A = 4'b0011;
B = 4'b1100;
isEqual = 0;
isGreater = 1;
isLess = 0;
#10;

A = 4'b0011;
B = 4'b1100;
isEqual = 0;
isGreater = 0;
isLess = 1;
#10;

$finish;


end

endmodule
