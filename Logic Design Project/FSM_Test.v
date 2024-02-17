module FSM_tb;
    reg [2:0] OPCODE;
    reg Clock, Clear;
    wire [3:0] Output;

    FSM uut(
        .OPCODE(OPCODE),
        .Clock(Clock),
        .Clear(Clear),
        .Output(Output)
    );

    // Clock generation
    always #5 Clock = ~Clock;

    // Initialize signals
    initial begin
        OPCODE = 3'b000;
        Clock = 0;
        Clear = 0;

        // Reset
        #10 Clear = 1;
        #10 Clear = 0;

        // Test case 1
        #10 OPCODE = 3'b000;  // mux = 2'b00
        #10 OPCODE = 3'b001;  // mux = 2'b01
        #10 OPCODE = 3'b010;  // mux = 2'b10
        #10 OPCODE = 3'b111;  // default

        // Test case 2
        #10 OPCODE = 3'b101;  // mux = 2'b10
        #10 OPCODE = 3'b100;  // mux = 2'b01
        #10 OPCODE = 3'b011;  // mux = 2'b00
        #10 OPCODE = 3'b110;  // default

        // Terminate simulation
        #10 $finish;
    end

    // Print output
    always @(posedge Clock) begin
        $display("OPCODE = %b, Output = %b", OPCODE, Output);
    end
endmodule

