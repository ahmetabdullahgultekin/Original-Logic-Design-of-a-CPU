
module Comparator(
input [17:0] CMP1,
input [17:0] CMP2,
input CMPsignal,
input clk,
input clear,
output  ZF,
output  CF
);

wire A_less, A_greater, equal;
reg regZF, regCF;

EighteenBitComparator a(.A(CMP1), .B(CMP2), .equal(equal), .A_greater(A_greater), .A_less(A_less));

OneBitRegister b(.in(regZF), .CLK(clk), .clear(clear), .enable(1'b1), .Q(ZF));
OneBitRegister c(.in(regCF), .CLK(clk), .clear(clear), .enable(1'b1), .Q(CF));

initial begin 
 regZF = 1'b0;
 regCF = 1'b0; 
end

always @(*)begin
if(clear) begin
  regZF = 1'b0;
  regCF = 1'b0;
end
if(~A_less & ~A_greater & equal)begin
 if(CMPsignal)
   regZF = 1'b1;
 else
   regZF = ZF;
end
else begin
 if(CMPsignal)
   regZF = 1'b0;
 else
   regZF = ZF;
end

if(A_less & ~A_greater & ~equal)begin
if(CMPsignal)
   regCF = 1'b1;
 else
   regCF = CF;
end
else begin
 if(CMPsignal)
   regCF = 1'b0;
 else
   regCF = CF;
end

end

endmodule 

