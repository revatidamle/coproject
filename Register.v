module Register(input[15:0] in_Reg,input[15:0] in_Reg1, output [15:0] out_Reg, input reg_Write,input reg_Write1, input Clk);

	DFF D0(in_Reg[0],in_Reg1[0],out_Reg[0],reg_Write,reg_Write1,Clk);
	DFF D1(in_Reg[1],in_Reg1[1],out_Reg[1],reg_Write,reg_Write1,Clk);
	DFF D2(in_Reg[2],in_Reg1[2],out_Reg[2],reg_Write,reg_Write1,Clk);
	DFF D3(in_Reg[3],in_Reg1[3],out_Reg[3],reg_Write,reg_Write1,Clk);
	DFF D4(in_Reg[4],in_Reg1[4],out_Reg[4],reg_Write,reg_Write1,Clk);
	DFF D5(in_Reg[5],in_Reg1[5],out_Reg[5],reg_Write,reg_Write1,Clk);
	DFF D6(in_Reg[6],in_Reg1[6],out_Reg[6],reg_Write,reg_Write1,Clk);
	DFF D7(in_Reg[7],in_Reg1[7],out_Reg[7],reg_Write,reg_Write1,Clk);
	DFF D8(in_Reg[8],in_Reg1[8],out_Reg[8],reg_Write,reg_Write1,Clk);
	DFF D9(in_Reg[9],in_Reg1[9],out_Reg[9],reg_Write,reg_Write1,Clk);
	DFF D10(in_Reg[10],in_Reg1[10],out_Reg[10],reg_Write,reg_Write1,Clk);
	DFF D11(in_Reg[11],in_Reg1[11],out_Reg[11],reg_Write,reg_Write1,Clk);
	DFF D12(in_Reg[12],in_Reg1[12],out_Reg[12],reg_Write,reg_Write1,Clk);
	DFF D13(in_Reg[13],in_Reg1[13],out_Reg[13],reg_Write,reg_Write1,Clk);
	DFF D14(in_Reg[14],in_Reg1[14],out_Reg[14],reg_Write,reg_Write1,Clk);
	DFF D15(in_Reg[15],in_Reg1[15],out_Reg[15],reg_Write,reg_Write1,Clk);

endmodule