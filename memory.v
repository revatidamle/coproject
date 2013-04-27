
module Memory(input [15:0]Addr,input [15:0]InData,input MemWrite, input MemRead, input Clk,output reg [15:0]MemOut);
	
	wire[7:0] MemOutput0;
	wire[7:0] MemOutput1;
	wire[7:0] muxout1;
	wire[7:0] muxout2;
	wire [15:0] Addr2;
	wire [39:0] MemWrite1;
	wire [39:0] MemWrite2;
	wire [39:0] MemDecOut;

	wire[7:0] MemOutput2,MemOutput3,MemOutput4,MemOutput5,MemOutput6,MemOutput7,MemOutput8,MemOutput9,MemOutput10,MemOutput11,MemOutput12,MemOutput13,MemOutput14,MemOutput15,MemOutput16,MemOutput17,MemOutput18,MemOutput19,MemOutput20,MemOutput21,MemOutput22,MemOutput23,MemOutput24,MemOutput25,MemOutput26,MemOutput27,MemOutput28,MemOutput29,MemOutput30,MemOutput31,MemOutput32,MemOutput33,MemOutput34,MemOutput35,MemOutput36,MemOutput37,MemOutput38,MemOutput39;

	dec16to40 d1640(Addr,MemDecOut);
		assign MemWrite1=MemDecOut&{MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite,MemWrite};
	assign MemWrite2=MemWrite1<<1;
	//load: 1000 111 000 000011
	//add: 0000 110 111 000 001
/* LW?
	Reg8bit rr0(8'b00001110,8'b00001010,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b00001110,8'b00001010,MemOutput1,0,1,Clk);

	Reg8bit rr2(8'b00001101,8'b11000001,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b00001101,8'b11000001,MemOutput3,0,1,Clk);
	Reg8bit rr4(8'b11110000,8'b11110000,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b11110000,8'b11110000,MemOutput5,0,1,Clk);*/

/*	ADD
	Reg8bit rr0(8'b10001110,8'b00000011,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b10001110,8'b00000011,MemOutput1,0,1,Clk);

	Reg8bit rr2(8'b00001101,8'b11000001,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b00001101,8'b11000001,MemOutput3,0,1,Clk);
	Reg8bit rr4(8'b11110000,8'b11110000,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b11110000,8'b11110000,MemOutput5,0,1,Clk);*/
	
/* LOAD-ADD check, result in alulo should be 1111000011110011
	Reg8bit rr0(8'b10001110,8'b00000011,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b10001110,8'b00000011,MemOutput1,0,1,Clk);
	Reg8bit rr2(8'b00001101,8'b11000001,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b00001101,8'b11000001,MemOutput3,0,1,Clk);

	Reg8bit rr4(8'b11110000,8'b11110000,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b11110000,8'b11110000,MemOutput5,0,1,Clk);
*/
	//divide: 0011 111 110 010 011
	//store:  1001 010 000 000 100 : 4 would be stored  not wrking 
	//load : 1000 111 000 000 100 : 4 would be loaded in 111
	//add : 0000 101 111 000 000 
	
	//jump: 11000000 00000100  
	
	//jalr 1101 111 000 000 001
	/*
	//SW: 1001 010 000 000101
	//LW: 1000 111 000 000101
	//ADD: 0000 110 111 000 001
	Reg8bit rr0(8'b10010100,8'b00000101,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b10010100,8'b00000101,MemOutput1,0,1,Clk);
	Reg8bit rr2(8'b10001110,8'b00000101,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b10001110,8'b00000101,MemOutput3,0,1,Clk);
	Reg8bit rr4(8'b00001101,8'b11000001,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b00001101,8'b11000001,MemOutput5,0,1,Clk;*/
	/* LOAD, STORE,ADD
	Reg8bit rr0(8'b10010100,8'b00000101,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b10010100,8'b00000101,MemOutput1,0,1,Clk);
	Reg8bit rr2(8'b10001110,8'b00000101,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b10001110,8'b00000101,MemOutput3,0,1,Clk);
	Reg8bit rr4(8'b00001101,8'b11000001,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b00001101,8'b11000001,MemOutput5,0,1,Clk);*/
	
	Reg8bit rr0(8'b11011110,8'b00000001,MemOutput0,1,0,Clk);
	Reg8bit rr1(8'b11011110,8'b00000001,MemOutput1,0,1,Clk);
	Reg8bit rr2(8'b10001110,8'b00000101,MemOutput2,1,0,Clk);
	Reg8bit rr3(8'b10001110,8'b00000101,MemOutput3,0,1,Clk);
	Reg8bit rr4(8'b00001101,8'b11000001,MemOutput4,1,0,Clk);
	Reg8bit rr5(8'b00001101,8'b11000001,MemOutput5,0,1,Clk);
	
	Reg8bit rr6(InData[15:8],InData[7:0],MemOutput6,MemWrite1[6],MemWrite2[6],Clk);
	Reg8bit rr7(InData[15:8],InData[7:0],MemOutput7,MemWrite1[7],MemWrite2[7],Clk);
	Reg8bit rr8(InData[15:8],InData[7:0],MemOutput8,MemWrite1[8],MemWrite2[8],Clk);
	Reg8bit rr9(InData[15:8],InData[7:0],MemOutput9,MemWrite1[9],MemWrite2[9],Clk);
	Reg8bit rr10(InData[15:8],InData[7:0],MemOutput10,MemWrite1[10],MemWrite2[10],Clk);
	Reg8bit rr11(InData[15:8],InData[7:0],MemOutput11,MemWrite1[11],MemWrite2[11],Clk);
	Reg8bit rr12(InData[15:8],InData[7:0],MemOutput12,MemWrite1[12],MemWrite2[12],Clk);
	Reg8bit rr13(InData[15:8],InData[7:0],MemOutput13,MemWrite1[13],MemWrite2[13],Clk);
	Reg8bit rr14(InData[15:8],InData[7:0],MemOutput14,MemWrite1[14],MemWrite2[14],Clk);
	Reg8bit rr15(InData[15:8],InData[7:0],MemOutput15,MemWrite1[15],MemWrite2[15],Clk);
	Reg8bit rr16(InData[15:8],InData[7:0],MemOutput16,MemWrite1[16],MemWrite2[16],Clk);
	Reg8bit rr17(InData[15:8],InData[7:0],MemOutput17,MemWrite1[17],MemWrite2[17],Clk);
	Reg8bit rr18(InData[15:8],InData[7:0],MemOutput18,MemWrite1[18],MemWrite2[18],Clk);
	Reg8bit rr19(InData[15:8],InData[7:0],MemOutput19,MemWrite1[19],MemWrite2[19],Clk);
	Reg8bit rr20(InData[15:8],InData[7:0],MemOutput20,MemWrite1[20],MemWrite2[20],Clk);
	Reg8bit rr21(InData[15:8],InData[7:0],MemOutput21,MemWrite1[21],MemWrite2[21],Clk);
	Reg8bit rr22(InData[15:8],InData[7:0],MemOutput22,MemWrite1[22],MemWrite2[22],Clk);
	Reg8bit rr23(InData[15:8],InData[7:0],MemOutput23,MemWrite1[23],MemWrite2[23],Clk);
	Reg8bit rr24(InData[15:8],InData[7:0],MemOutput24,MemWrite1[24],MemWrite2[24],Clk);
	Reg8bit rr25(InData[15:8],InData[7:0],MemOutput25,MemWrite1[25],MemWrite2[25],Clk);
	Reg8bit rr26(InData[15:8],InData[7:0],MemOutput26,MemWrite1[26],MemWrite2[26],Clk);
	Reg8bit rr27(InData[15:8],InData[7:0],MemOutput27,MemWrite1[27],MemWrite2[27],Clk);
	Reg8bit rr28(InData[15:8],InData[7:0],MemOutput28,MemWrite1[28],MemWrite2[28],Clk);
	Reg8bit rr29(InData[15:8],InData[7:0],MemOutput29,MemWrite1[29],MemWrite2[29],Clk);
	Reg8bit rr30(InData[15:8],InData[7:0],MemOutput30,MemWrite1[30],MemWrite2[30],Clk);
	Reg8bit rr31(InData[15:8],InData[7:0],MemOutput31,MemWrite1[31],MemWrite2[31],Clk);
	Reg8bit rr32(InData[15:8],InData[7:0],MemOutput32,MemWrite1[32],MemWrite2[32],Clk);
	Reg8bit rr33(InData[15:8],InData[7:0],MemOutput33,MemWrite1[33],MemWrite2[33],Clk);
	Reg8bit rr34(InData[15:8],InData[7:0],MemOutput34,MemWrite1[34],MemWrite2[34],Clk);
	Reg8bit rr35(InData[15:8],InData[7:0],MemOutput35,MemWrite1[35],MemWrite2[35],Clk);
	Reg8bit rr36(InData[15:8],InData[7:0],MemOutput36,MemWrite1[36],MemWrite2[36],Clk);
	Reg8bit rr37(InData[15:8],InData[7:0],MemOutput37,MemWrite1[37],MemWrite2[37],Clk);
	Reg8bit rr38(InData[15:8],InData[7:0],MemOutput38,MemWrite1[38],MemWrite2[38],Clk);
	Reg8bit rr39(InData[15:8],InData[7:0],MemOutput39,MemWrite1[39],MemWrite2[39],Clk);
	

	mux40to1 m4_0(Addr,MemOutput0,MemOutput1,MemOutput2,MemOutput3,MemOutput4,MemOutput5,MemOutput6,MemOutput7,MemOutput8,MemOutput9,MemOutput10,MemOutput11,MemOutput12,MemOutput13,MemOutput14,MemOutput15,MemOutput16,MemOutput17,MemOutput18,MemOutput19,MemOutput20,MemOutput21,MemOutput22,MemOutput23,MemOutput24,MemOutput25,MemOutput26,MemOutput27,MemOutput28,MemOutput29,MemOutput30,MemOutput31,MemOutput32,MemOutput33,MemOutput34,MemOutput35,MemOutput36,MemOutput37,MemOutput38,MemOutput39,muxout1);

	assign Addr2=Addr+1;
	mux40to1 m4_1(Addr2,MemOutput0,MemOutput1,MemOutput2,MemOutput3,MemOutput4,MemOutput5,MemOutput6,MemOutput7,MemOutput8,MemOutput9,MemOutput10,MemOutput11,MemOutput12,MemOutput13,MemOutput14,MemOutput15,MemOutput16,MemOutput17,MemOutput18,MemOutput19,MemOutput20,MemOutput21,MemOutput22,MemOutput23,MemOutput24,MemOutput25,MemOutput26,MemOutput27,MemOutput28,MemOutput29,MemOutput30,MemOutput31,MemOutput32,MemOutput33,MemOutput34,MemOutput35,MemOutput36,MemOutput37,MemOutput38,MemOutput39,muxout2);
	
	always@(muxout1,muxout2)
	begin

		MemOut[15:8]=muxout1[7:0];
		MemOut[7:0]=muxout2[7:0];
	end

endmodule

/*
module testbench();

	reg Clk,MemWrite,MemRead;
	reg[15:0] Addr,InData;
	wire[15:0] MemOut, Addr2;
	wire[7:0] MemOutput0;
	wire[7:0] MemOutput1;
	wire[7:0] muxout1;
	wire[7:0] muxout2;
	
	
	//module Memory(input [15:0]Addr,input [15:0]InData,input MemWrite, input MemRead, input Clk,output reg [15:0]MemOut );
	Memory mem (Addr, InData, MemWrite, MemRead, Clk, MemOut, MemOutput0, MemOutput1,muxout1,muxout2, Addr2);

	initial begin
	$monitor("clk=%b | memout=%b ",Clk,MemOut);
	Clk=1;MemWrite=1;
	#10 Addr=2; InData=16'b1111111100000000;
	#10 Addr=4; InData=16'b1010101010101010;
	#10 Addr=0;
	#50 $finish;
	end

	always begin
	#5 Clk=~Clk;
	end
endmodule
*/
