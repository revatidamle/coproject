module Mux2to1(input control, input[15:0] in0, input[15:0] in1, output reg[15:0] out);
always @ (in0 or in1 or control) begin
	case(control)
		1'b0: out=in0;
		1'b1: out=in1;
	endcase
end
endmodule
