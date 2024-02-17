module ProgramCounter_test;
reg clk;
reg reset;
reg enable;
reg [10:0] in;
wire [10:0] pc;

ProgramCounter DUT (
.clk(clk),
.reset(reset),
.enable(enable),
.in(in),
.pc(pc)
);

initial begin
clk = 1;
reset = 1;
enable = 1;
in = 11'b1;

#10 reset = 0;

#10 enable = 1;
in = 11'b101;
#20 enable = 0;
in = 11'b0;
#10 enable = 1;
in = 11'b110;
#20 enable = 0;
in = 11'b0;
#10 enable = 1;
in = 11'b111;
#30 enable = 0;
in = 11'b0;
#10 enable = 1;
in = 11'b100;
#40 enable = 0;
in = 11'b0;

#100 $finish;
end

always begin
#5 clk = ~clk;
end

endmodule