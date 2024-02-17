module FSM(
    input [2:0] OPCODE,
    input Clock,
    input Clear,
    output reg [3:0] Output
);
    
    reg [3:0] mux_out;
    wire [3:0] reg_out;
    
    FourBitRegister a(.in(mux_out), .enable(1'b1), .clear(Clear), .CLK(Clock), .Q(reg_out));
    
    always @(posedge Clock or reg_out) begin
        if (Clear) begin
            mux_out <= 4'b0000;
        end else begin
            case (reg_out)
                4'b1000: mux_out <= {1'b0, OPCODE};
 		4'b0100: mux_out <= 4'b1001;
                default: mux_out <= 4'b1000;
            endcase
        end
     end
assign Output = mux_out;


endmodule


