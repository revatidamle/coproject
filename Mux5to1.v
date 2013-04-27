module Mux5to1(input[2:0] control, input[15:0] in0, input[15:0] in1, input[15:0] in2, input[15:0] in3, input[15:0] in4, output reg[15:0] out);
always @ (control or in0 or in1 or in2 or in3 or in4) begin
	case(control)
		3'b000: out=in0;
		3'b001: out=in1;
		3'b010: out=in2;
		3'b011: out=in3;
		3'b100: out=in4;
		default: out=0;
	endcase
end
endmodule
