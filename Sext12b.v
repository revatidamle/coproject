module Sext12b(input[11:0] in, output reg[15:0] out);

	always @ (in)
		out = {in[5],in[5],in[5],in[5],in};

endmodule