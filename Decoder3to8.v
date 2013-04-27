module Decoder3to8(DestReg, DecOut);
	input [2:0] DestReg;
	output reg [7:0] DecOut;
	always@(DestReg)
	casex(DestReg)
		3'b000: DecOut=8'b00000001;
		3'b001: DecOut=8'b00000010;
		3'b010: DecOut=8'b00000100;
		3'b011: DecOut=8'b00001000;
		3'b100: DecOut=8'b00010000;
		3'b101: DecOut=8'b00100000;
		3'b110: DecOut=8'b01000000;
		3'b111: DecOut=8'b10000000;
	endcase
endmodule