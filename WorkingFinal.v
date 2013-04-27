/*iverilog WorkingFinal.v ALU.v memory.v Mux2to1.v Mux4to1.v Mux4to1_3bit.v Mux5to1.v RegFile.v Register.v Sext6b.v Sext3b.v Zext6b.v ctrlckt.v shift1.v concat.v DFF.v Decoder3to8.v Mux8to1.v Reg8bit.v dec16to40.v divide.v mux40to1.v */



module WorkingFinal(input clk, input reset, output wire[15:0] MemOut,output wire ccpcwrite, output wire ccirwrite, output wire ccA, output wire ccB, output wire [2:0] ccC, output wire [3:0]opcodereg, output wire[15:0] IRout, output wire[3:0] ccaluop, output wire [15:0] AluOutLo, output wire [15:0] AluOutHi,output wire [15:0]ALUInA,output wire [15:0]ALUInB,output wire [15:0]ALUInC,output wire [15:0] PCin,output wire [15:0] PCout, output wire[15:0] MemAddr, output wire[2:0] RFinB, output wire[15:0] OutBusB, output wire[15:0] DMRout,output wire[15:0] RegWD1,output wire [2:0]curstate, output wire ccw1);
	wire[15:0] LOout,Bout, RegWD2,OutBusA,OutBusC,Aout,Cout,PCSrcIn1,AluSrcCIn1,AluSrcCIn2,AluSrcCIn3,AluSrcCIn4;
	wire wNZ, wire1, PCwrite1,ccw2,ccpcwritecond,cciord,ccmemread,ccmemwrite,ccpcinit;
	wire[1:0] ccpcsource,ccmemtoreg;
//	wire[2:0] RFinB;
//	wire[3:0] ccaluop;
	
	reg pccontrol;

	ctrlckt  cc (clk,reset,IRout[15:12],ccw1,ccw2,ccpcwritecond,ccpcwrite,cciord,ccmemread,ccmemwrite,ccmemtoreg,ccirwrite,ccA,ccB,ccC,ccpcsource,ccaluop,ccpcinit,opcodereg,curstate);

	and(wire1,ccpcwritecond,wNZ);
	or(PCwrite1,wire1,ccpcwrite);

	Register PC (PCin,0,PCout,PCwrite1,ccpcinit,clk);
	
	Mux2to1 IorD (cciord,PCout,LOout,MemAddr);

	Memory mem1(MemAddr,Bout,ccmemwrite,ccmemread,clk,MemOut);

	IRlt ir1(clk,MemOut,ccirwrite,IRout);
	
	Register DMR(MemOut,0,DMRout,1,0,clk);

	Mux4to1 MemToReg(ccmemtoreg,DMRout,LOout,PCout,1,RegWD1);

	Mux4to1_3bit m4to13bit (IRout[5:3],IRout[11:9],IRout[15:14],RFinB);

	//module RegFile(SrcA, SrcB,SrcC, DestReg, WriteData,WriteData1, OutBusA, OutBusB,OutBusC,reg_Write,reg_Write1, Clk);

	RegFile rfile1 (IRout[8:6],RFinB,IRout[2:0],IRout[11:9],RegWD1,RegWD2,OutBusA,OutBusB,OutBusC,ccw1,ccw2,clk);
	Register RegAluSrcA(OutBusA,0,Aout,1,0,clk);
	Register RegAluSrcB(OutBusB,0,Bout,1,0,clk);
	Register RegAluSrcC(OutBusC,0,Cout,1,0,clk);


	shiftconcat conc (PCout,IRout[11:0],PCSrcIn1);

	Sext6b s6b (IRout[5:0], AluSrcCIn2);
	shift1 sh1 (AluSrcCIn2,AluSrcCIn1);
	Zext6b z6b (IRout[5:0],AluSrcCIn4);

	Mux2to1 AluSrcA(ccA, PCout, Aout, ALUInA);
	Mux2to1 AluSrcB(ccB, 16'd2, Bout,ALUInB);
	Mux5to1 AluSrcC(ccC, Cout, AluSrcCIn1, AluSrcCIn2, AluSrcCIn3, AluSrcCIn4, ALUInC);

	

	//module ALU(input[3:0] opcode, input[15:0] A, input[15:0] B, input[15:0] C, output reg [15:0] LO, output reg[15:0] HI, output reg NZ);

	ALU alu (ccaluop, ALUInA,ALUInB,ALUInC, AluOutLo,AluOutHi,wNZ);

	Register HI(AluOutHi,0,RegWD2,1,ccpcinit,clk);
	Register LO(AluOutLo,0,LOout,1,ccpcinit,clk);

	Mux4to1 PCSrc (ccpcsource,AluOutLo,PCSrcIn1,LOout,1,PCin);

endmodule

module testbench;

	reg clk,reset;
	wire[15:0] MemOut,IRout;
	wire ccpcwrite,ccirwrite,ccA,ccB,ccw1;
	wire[2:0] ccC, RFinB,curstate;
	wire [3:0]opcodereg;
	wire[3:0] ccaluop;
	wire[15:0] AluOutLo,AluOutHi,ALUInA,ALUInB,ALUInC,PCin,PCout,MemAddr,DMRout,RegWD1;
	wire[15:0] OutBusB;

	//module WorkingFinal(input clk, output wire[15:0] MemOut);
	WorkingFinal wf (clk,reset,MemOut,ccpcwrite,ccirwrite,ccA,ccB,ccC,opcodereg,IRout,ccaluop,AluOutLo,AluOutHi,ALUInA,ALUInB,ALUInC,PCin,PCout,MemAddr,RFinB,OutBusB,DMRout,RegWD1,curstate,ccw1);

	initial begin
	$monitor($time,"curstate=%b , memout=%b | ccpcwrite=%b ,ccirwrite=%b ,ccA=%b,ccB=%b,ccC=%b,opcodereg=%b,irout=%b,ccaluop=%b,AluOutLo=%b,AluOutHi=%b,ALUInA=%b,ALUInB=%b ,ALUInC=%b,PCin=%b,PCout=%b,MemAddr=%b | RFinB=%b, OutBusB=%b | DMRout=%b,RegWD1=%b, ccw1=%b",curstate,MemOut,ccpcwrite,ccirwrite,ccA,ccB,ccC,opcodereg,IRout,ccaluop,AluOutLo,AluOutHi,ALUInA,ALUInB,ALUInC,PCin,PCout,MemAddr,RFinB,OutBusB,DMRout,RegWD1,ccw1);
	clk=1; reset=1;
	#198 reset=0;
	#1000 $finish;
	end

	always begin
	#21 clk=~clk;
	end
endmodule
