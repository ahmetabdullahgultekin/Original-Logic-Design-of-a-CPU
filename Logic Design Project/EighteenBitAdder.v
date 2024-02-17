

module EighteenBitAdder( 
  input [17:0] SRC1,
  input [17:0] SRC2,
  output [17:0] Output
);

wire [17:0] carry; 

FullAdder bit0(.A(SRC1[0]), .B(SRC2[0]), .Ci(1'b0), .S(Output[0]), .Co(carry[0]));
FullAdder bit1(.A(SRC1[1]), .B(SRC2[1]), .Ci(carry[0]), .S(Output[1]), .Co(carry[1]));
FullAdder bit2(.A(SRC1[2]), .B(SRC2[2]), .Ci(carry[1]), .S(Output[2]), .Co(carry[2]));

FullAdder bit3(.A(SRC1[3]), .B(SRC2[3]), .Ci(carry[2]), .S(Output[3]), .Co(carry[3]));
FullAdder bit4(.A(SRC1[4]), .B(SRC2[4]), .Ci(carry[3]), .S(Output[4]), .Co(carry[4]));
FullAdder bit5(.A(SRC1[5]), .B(SRC2[5]), .Ci(carry[4]), .S(Output[5]), .Co(carry[5]));

FullAdder bit6(.A(SRC1[6]), .B(SRC2[6]), .Ci(carry[5]), .S(Output[6]), .Co(carry[6]));
FullAdder bit7(.A(SRC1[7]), .B(SRC2[7]), .Ci(carry[6]), .S(Output[7]), .Co(carry[7]));
FullAdder bit8(.A(SRC1[8]), .B(SRC2[8]), .Ci(carry[7]), .S(Output[8]), .Co(carry[8]));

FullAdder bit9(.A(SRC1[9]), .B(SRC2[9]), .Ci(carry[8]), .S(Output[9]), .Co(carry[9]));
FullAdder bit10(.A(SRC1[10]), .B(SRC2[10]), .Ci(carry[9]), .S(Output[10]), .Co(carry[10]));

FullAdder bit11(.A(SRC1[11]), .B(SRC2[11]), .Ci(carry[10]), .S(Output[11]), .Co(carry[11]));
FullAdder bit12(.A(SRC1[12]), .B(SRC2[12]), .Ci(carry[11]), .S(Output[12]), .Co(carry[12]));
FullAdder bit13(.A(SRC1[13]), .B(SRC2[13]), .Ci(carry[12]), .S(Output[13]), .Co(carry[13]));
FullAdder bit14(.A(SRC1[14]), .B(SRC2[14]), .Ci(carry[13]), .S(Output[14]), .Co(carry[14]));
FullAdder bit15(.A(SRC1[15]), .B(SRC2[15]), .Ci(carry[14]), .S(Output[15]), .Co(carry[15]));
FullAdder bit16(.A(SRC1[16]), .B(SRC2[16]), .Ci(carry[15]), .S(Output[16]), .Co(carry[16]));
FullAdder bit17(.A(SRC1[17]), .B(SRC2[17]), .Ci(carry[16]), .S(Output[17]), .Co(carry[17]));

endmodule