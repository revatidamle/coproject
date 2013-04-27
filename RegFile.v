module RegFile(SrcA, SrcB,SrcC, DestReg, WriteData,WriteData1, OutBusA, OutBusB,OutBusC,reg_Write,reg_Write1, Clk);
	input [2:0]SrcA, SrcB,SrcC, DestReg;
	input Clk,reg_Write,reg_Write1;
	input [15:0]WriteData,WriteData1;

	output[15:0]OutBusA, OutBusB,OutBusC;
	wire [7:0]DecOut,DecOut1,Array,Array1;
	wire [15:0]out_Reg1,out_Reg2,out_Reg3,out_Reg4,out_Reg5,out_Reg6,out_Reg7,out_Reg8;
	wire [2:0]out;

		/*Register R1(WriteData,WriteData1,out_Reg1,Array[0],Array1[0],Clk);
		Register R2(WriteData,WriteData1,out_Reg2,Array[1],Array1[1],Clk);
		Register R3(WriteData,WriteData1,out_Reg3,Array[2],Array1[2],Clk);
		Register R4(WriteData,WriteData1,out_Reg4,Array[3],Array1[3],Clk);*/

		Register R1(16'd1,WriteData1,out_Reg1,1,0,Clk);
		Register R2(16'd3,WriteData1,out_Reg2,1,0,Clk);
		Register R3(16'd4,WriteData1,out_Reg3,1,0,Clk);
		Register R4(16'd15,WriteData1,out_Reg4,1,0,Clk);

		Register R5(WriteData,WriteData1,out_Reg5,Array[4],Array1[4],Clk);
		Register R6(WriteData,WriteData1,out_Reg6,Array[5],Array1[5],Clk);
		Register R7(WriteData,WriteData1,out_Reg7,Array[6],Array1[6],Clk);
		Register R8(WriteData,WriteData1,out_Reg8,Array[7],Array1[7],Clk);


		Decoder3to8 dec(DestReg,DecOut);
		Decoder3to8 dec1(SrcA,DecOut1);
		
		and (Array1[0],DecOut1[0],reg_Write1);
		and (Array1[1],DecOut1[1],reg_Write1);
		and (Array1[2],DecOut1[2],reg_Write1);
		and (Array1[3],DecOut1[3],reg_Write1);
		and (Array1[4],DecOut1[4],reg_Write1);
		and (Array1[5],DecOut1[5],reg_Write1);
		and (Array1[6],DecOut1[6],reg_Write1);
		and (Array1[7],DecOut1[7],reg_Write1);

		and (Array[0],DecOut[0],reg_Write);
		and (Array[1],DecOut[1],reg_Write);
		and (Array[2],DecOut[2],reg_Write);
		and (Array[3],DecOut[3],reg_Write);
		and (Array[4],DecOut[4],reg_Write);
		and (Array[5],DecOut[5],reg_Write);
		and (Array[6],DecOut[6],reg_Write);
		and (Array[7],DecOut[7],reg_Write);

		Mux8to1 m(out_Reg1,out_Reg2,out_Reg3,out_Reg4,out_Reg5,out_Reg6,out_Reg7,out_Reg8,OutBusA,SrcA);
		Mux8to1 m1(out_Reg1,out_Reg2,out_Reg3,out_Reg4,out_Reg5,out_Reg6,out_Reg7,out_Reg8,OutBusB,SrcB);
		Mux8to1 m2(out_Reg1,out_Reg2,out_Reg3,out_Reg4,out_Reg5,out_Reg6,out_Reg7,out_Reg8,OutBusC,SrcC);

endmodule


/*

module testbench();
		reg [2:0]SrcA, SrcB,SrcC, DestReg;
		reg Clk,reg_Write,reg_Write1;
		reg [15:0]WriteData,WriteData1,IR;

		wire[15:0]OutBusA, OutBusB,OutBusC; 


		initial
			begin
				Clk=1'b1;
				repeat(50)
				#5 Clk=~Clk;
			end

		RegFile rf(SrcA, SrcB,SrcC, DestReg,IR, WriteData,WriteData1, OutBusA, OutBusB,OutBusC,reg_Write,reg_Write1, Clk);
		initial
			begin
				IR=16'b1000000000000000;
				WriteData=16'd1;
				WriteData1=16'd2;
				reg_Write=1'b1;	
				reg_Write1=1'b1;

				SrcA=3'b000;
				SrcB=3'b000;
				SrcC=3'b100;
				DestReg=3'b001;
				
			#10 
				SrcA=3'b000;
				SrcB=3'b001;
				SrcC=3'b000;
				reg_Write=1'b0;
				reg_Write1=1'b0;
			end

		initial
			$monitor($time,"OutBusC=%b OutBusB=%b",OutBusC,OutBusB);

endmodule




*/
