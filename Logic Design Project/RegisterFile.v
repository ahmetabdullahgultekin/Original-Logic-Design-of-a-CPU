module RegisterFile(ReadEnable1,ReadEnable2,ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);

	/* Please fill in the implementation here... */ 
	input [3:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [17:0] WriteData;
	input ReadEnable1,ReadEnable2,RegWrite,Clk;
	
	output reg [17:0] ReadData1,ReadData2;
	
	
	
	 reg [17:0] Registers [0:15];
       
	
	always @(posedge Clk)
	begin
		if (RegWrite == 1) 
		begin
			Registers[WriteRegister] <= WriteData;
		end
        end
        always @(posedge Clk) begin
		if (ReadEnable1 == 1)
		begin
			ReadData1 <= Registers[ReadRegister1];
		end
        end
        always @(posedge Clk) begin
		if (ReadEnable2 == 1)
		begin
			ReadData2 <= Registers[ReadRegister2];
		end
	end
endmodule
