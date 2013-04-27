module shiftconcat (input[15:0] in1, input[11:0] in2, output reg[15:0] out);
reg[11:0] temp;
always @ (in1,in2) begin
	out = {in1[15:13],in2,1'b0};
end

endmodule 