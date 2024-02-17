module RegisterFile_tb();

	reg ReadEnable1, ReadEnable2, RegWrite, Clk;
	reg [3:0] ReadRegister1, ReadRegister2, WriteRegister;
	reg [17:0] WriteData;
	wire [17:0] ReadData1, ReadData2;

	// Instantiate the RegisterFile module
	RegisterFile UUT (
		.ReadEnable1(ReadEnable1),
		.ReadEnable2(ReadEnable2),
		.ReadRegister1(ReadRegister1),
		.ReadRegister2(ReadRegister2),
		.WriteRegister(WriteRegister),
		.WriteData(WriteData),
		.RegWrite(RegWrite),
		.Clk(Clk),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);

	// Clock generation
	always begin
		#5 Clk = ~Clk;
	end

	// Test scenario
	initial begin
		// Initialize inputs
		Clk = 0;
		ReadEnable1 = 0;
		ReadEnable2 = 0;
		RegWrite = 0;
		ReadRegister1 = 0;
		ReadRegister2 = 0;
		WriteRegister = 0;
		WriteData = 0;

		// Apply stimulus
		#10 ReadEnable1 = 1;  // Enable reading from Register 0
		#10 ReadRegister1 = 1001;  // Read from Register 5
		#10 WriteRegister = 5;  // Write to Register 5
		#10 WriteData = 123;  // Write integer value 123
		#10 RegWrite = 1;  // Enable register write
		#10 ReadEnable1 = 0;  // Disable reading from Register 0
		#10 ReadEnable2 = 1;  // Enable reading from Register 5
		#10 ReadRegister2 = 5;  // Read from Register 5

		// Add more test scenarios here...

		#100 $finish;  // Finish simulation
	end

endmodule

