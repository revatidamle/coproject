module Mux4to1(input[1:0] control, input[15:0] in0, input[15:0] in1, input[15:0] in2, input[15:0] in3, output reg[15:0] out);
always @ (control or in0 or in1 or in2 or in3) begin
	case(control)
		2'b00: out=in0;
		2'b01: out=in1;
		2'b10: out=in2;
		2'b11: out=in3;
	endcase
end
endmodule
