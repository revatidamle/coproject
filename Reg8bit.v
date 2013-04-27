module Reg8bit(input[7:0] in_Reg,input[7:0] in_Reg1, output [7:0] out_Reg, input reg_Write,input reg_Write1, input Clk);


	DFF D(in_Reg[0],in_Reg1[0],out_Reg[0],reg_Write,reg_Write1,Clk);
	DFF D1(in_Reg[1],in_Reg1[1],out_Reg[1],reg_Write,reg_Write1,Clk);
	DFF D2(in_Reg[2],in_Reg1[2],out_Reg[2],reg_Write,reg_Write1,Clk);
	DFF D3(in_Reg[3],in_Reg1[3],out_Reg[3],reg_Write,reg_Write1,Clk);
	DFF D4(in_Reg[4],in_Reg1[4],out_Reg[4],reg_Write,reg_Write1,Clk);
	DFF D5(in_Reg[5],in_Reg1[5],out_Reg[5],reg_Write,reg_Write1,Clk);
	DFF D6(in_Reg[6],in_Reg1[6],out_Reg[6],reg_Write,reg_Write1,Clk);
	DFF D7(in_Reg[7],in_Reg1[7],out_Reg[7],reg_Write,reg_Write1,Clk);
	
endmodule
