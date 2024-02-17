module ElevenBitAdder_Test;

  reg [10:0] SRC1;
  reg [10:0] SRC2;
  wire [10:0] Output;

  ElevenBitAdder DUT(
    .SRC1(SRC1),
    .SRC2(SRC2),
    .Output(Output)
  );

  initial begin
    // Initialize inputs
    SRC1 = 11'b01101110101;
    SRC2 = 11'b10011100010;

    // Display input values
    $display("SRC1 = %b", SRC1);
    $display("SRC2 = %b", SRC2);

    // Wait for all the signals to settle
    #10;

    // Display output value
    $display("Output = %b", Output);
  end

endmodule

