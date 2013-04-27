module Mux8to1(reg_Out1,reg_Out2,reg_Out3,reg_Out4,reg_Out5,reg_Out6,reg_Out7,reg_Out8,Bus,Src);
	input[15:0]reg_Out1,reg_Out2,reg_Out3,reg_Out4,reg_Out5,reg_Out6,reg_Out7,reg_Out8;
	input[2:0]Src;
	output reg [15:0]Bus;

	always@(reg_Out1,reg_Out2,reg_Out3,reg_Out4,reg_Out5,reg_Out6,reg_Out7,reg_Out8 ,Src)
	begin
	case(Src)
		3'b000:Bus=reg_Out1;
		3'b001:Bus=reg_Out2;
		3'b010:Bus=reg_Out3;
		3'b011:Bus=reg_Out4;
		3'b100:Bus=reg_Out5;
		3'b101:Bus=reg_Out6;
		3'b110:Bus=reg_Out7;
		3'b111:Bus=reg_Out8;
	endcase
	end
	// Register
endmodule
