module ProgramCounter (
  input clk,
  input reset,
  input enable,
  input [10:0] in,
  output [10:0] pc
);

reg [10:0] countReg;

always @(posedge clk or posedge reset) begin
 if (reset) begin
      countReg <= 11'b0;  
    end else if (enable) begin
      countReg <= in ;  //+1?
    end
  end

assign pc = countReg;
endmodule