module Mux4to1_3bit(input [2:0]Src1,input [2:0]Src2, input [1:0]index,output reg [2:0]out);
	always@(Src1,Src2,index)
	begin
	case(index)
		2'b00:out=Src1;
		2'b10:out=Src2;
		2'b01:out=Src1;
		2'b11:out=Src1;
endcase

end
endmodule
