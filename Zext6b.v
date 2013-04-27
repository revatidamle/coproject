module Zext6b(input[5:0] in, output reg[15:0] out);

	always @ (in)
		out = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,in};

endmodule