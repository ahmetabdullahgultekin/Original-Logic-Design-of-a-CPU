module EighteenBitAdder_Test();

reg [17:0] SRC1;
reg [17:0] SRC2;
wire [17:0] Output;

EighteenBitAdder uut (
.SRC1(SRC1),
.SRC2(SRC2),
.Output(Output)
);

initial begin
$display("Testing EighteenBitAdder:");

// Test Case 1: SRC1 = 0, SRC2 = 0
SRC1 = 18'b000000000000000000;
SRC2 = 18'b000000000000000000;
#10;
$display("Test Case 1 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

// Test Case 2: SRC1 = 0, SRC2 = 1
SRC1 = 18'b000000000000000000;
SRC2 = 18'b000000000000000001;
#10;
$display("Test Case 2 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

// Test Case 3: SRC1 = 1, SRC2 = 0
SRC1 = 18'b000000000000000001;
SRC2 = 18'b000000000000000000;
#10;
$display("Test Case 3 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

// Test Case 4: SRC1 = 1, SRC2 = 1
SRC1 = 18'b000000000000000001;
SRC2 = 18'b000000000000000001;
#10;
$display("Test Case 4 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

// Test Case 5: SRC1 = 123, SRC2 = 456
SRC1 = 18'b000000000111101011;
SRC2 = 18'b000000011110100000;
#10;
$display("Test Case 5 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

// Test Case 6: SRC1 = 100000000000000000, SRC2 = 111111111111111111
SRC1 = 18'b100000000000000000;
SRC2 = 18'b111111111111111111;
#10;
$display("Test Case 6 - SRC1 = %b, SRC2 = %b, Output = %b", SRC1, SRC2, Output);

$finish;

end

endmodule
