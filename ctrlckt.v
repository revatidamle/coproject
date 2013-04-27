module ctrlckt(input clk,
input reset,
input [3:0] opcode,
output reg w1,
output reg w2,
output reg pcwritecond,
output reg pcwrite,
output reg iord,
output reg memread,
output reg memwrite,
output reg [1:0] memtoreg,
output reg irwrite,
output reg A,
output reg B,
output reg [2:0] C,
output reg [1:0] pcsource,
output reg [3:0] aluop,
output reg ccpcinit,
output reg [3:0]opcodereg,

output reg [2:0]curstate);
//reg [3:0] opcodereg;
// linking to alu module
 //3'b000=add
 //3'b001=sub
 //3'b010=addsub
 //3'b011=divide
 //3'b100=shiftleft logical
 //3'b101=or
 //3'b110=shift right logical
// 3'b111=shift right arithmetic

always@(negedge clk)
	begin
	if(reset) begin
		curstate=3'b000;
		
		w1=1'b0;
		w2=1'b0;
//		opcodereg=opcode;
		pcwritecond=1'b0;
		pcwrite=1'b0;
		iord=1'b0;
		memread=1'b0;
		memwrite=1'b0;
		memtoreg=2'b00;
		irwrite=1'b0;
		A=1'b0;
		B=1'b0;
		C=3'b000;
		pcsource=2'b00;
		aluop=4'b0000;
		ccpcinit=1;
		$display("RESET DONE");

	end
	else begin
		ccpcinit=0;
		$display("______________________________________________");
		if(curstate==3'b000)
			begin
			curstate=3'b001;
			w1=1'b0;
			w2=1'b0;
			pcwritecond=1'b0;
			pcwrite=1'b1;
			iord=1'b0;
			memread=1'b1;
			memwrite=1'b0;
			memtoreg=2'b00;
			irwrite=1'b1;
		//	opcodereg=opcode;
			A=1'b0;
			B=1'b0;
			C=3'b000;
			pcsource=2'b00;
			aluop=4'b1111; //PC=PC+2
			$display("STATE 1");
		end
		
		else if(curstate==3'b001)
			begin
			opcodereg=opcode;
			curstate=3'b010;
			w1=1'b0;
			w2=1'b0;
			pcwritecond=1'b0;
			pcwrite=1'b0;
			iord=1'b0;
			memread=1'b0;
			memwrite=1'b0;
			memtoreg=2'b00;
			irwrite=1'b0;
			A=1'b0;
			B=1'b0;
			C=3'b001;
			pcsource=2'b00;
			aluop=4'b1100; //For branch address, using J's ALUOP
			$display("STATE 2");
		end


		else if(curstate==3'b010)
			begin
				$display("STATE 3");
				if(opcodereg==4'b0000)
				begin
				//	$display("xyz");
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b0000;
				end
				
				else if(opcodereg==4'b0001)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b0001;
				end
				
				else if (opcodereg==4'b0010)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b0010;
				end
				
				else if (opcodereg==4'b0011)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b0011;
				end
				
				else if(opcodereg == 4'b0100)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b011;
					pcsource=2'b00;
					aluop=4'b0100;
				end
				
				else if(opcodereg==4'b0101)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b011;
					pcsource=2'b00;
					aluop=4'b0101;
				end
				
				else if (opcodereg==4'b0110)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b011;
					pcsource=2'b00;
					aluop=4'b0110;
				end
				
				else if (opcodereg == 4'b0111)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b011;
					pcsource=2'b00;
					aluop=4'b0111;
				end
				
				else if (opcodereg==4'b1000)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b010;
					pcsource=2'b00;
					aluop=4'b1000;
				end
				
				else if(opcodereg==4'b1001)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b010;
					pcsource=2'b00;
					aluop=4'b1001;
				end
				
				else if (opcodereg==4'b1010)
				begin
					curstate=3'b000;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b1;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b1;
					C=3'b010;
					pcsource=2'b10;
					aluop=4'b1010;
				end
				
				else if(opcodereg==4'b1011)
				begin
					curstate=3'b011;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1011;
				end
				
				else if(opcodereg==4'b1100)
				begin
					curstate=3'b000;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b1;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b010;
					pcsource=2'b01;
					aluop=4'b1100;
				end
				
				else if(opcodereg == 4'b1101)
				begin
					curstate=3'b000;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b1;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b0;
					B=1'b1;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end		
			end

		else if (curstate==3'b011)	
			begin
				$display("State 4");
				if(opcodereg==4'b0000)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end	
				
				else if (opcodereg==4'b0001)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg == 4'b0010)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b0011)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b1;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b0100)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b0101)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b0110)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b0111)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b1000)
				begin
					$display("LOAD 4th state");
					curstate=3'b100;
					w1=1'b0;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b1;
					memread=1'b1;
					memwrite=1'b0;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
				end
				
				else if(opcodereg==4'b1001)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b1;
					memread=1'b0;
					memwrite=1'b1;
					memtoreg=2'b00;
					irwrite=1'b0;
					A=1'b1;
					B=1'b0;
					C=3'b100;
					pcsource=2'b00;
					aluop=4'b1110;
					opcodereg=opcode;
				end
				
				else if(opcodereg==4'b1011)
				begin
					curstate=3'b000;
					w1=1'b1;
					w2=1'b0;
					pcwritecond=1'b0;
					pcwrite=1'b0;
					iord=1'b0;
					memread=1'b0;
					memwrite=1'b0;
					memtoreg=2'b01;
					irwrite=1'b0;
					A=1'b0;
					B=1'b0;
					C=3'b000;
					pcsource=2'b00;
					aluop=4'b1110;
				end
			end

		else if (curstate==3'b100) begin
			$display("State 5");
			if(opcodereg==4'b1000)
			begin
				curstate=3'b000;
				w1=1'b1;
				w2=1'b0;
				pcwritecond=1'b0;
				pcwrite=1'b0;
				iord=1'b0;
				memread=1'b0;
				memwrite=1'b0;
				memtoreg=2'b00;
				irwrite=1'b0;
				A=1'b0;
				B=1'b0;
				C=3'b000;
				pcsource=2'b00;
				aluop=4'b1110;
			end	
		end
	end	
end

always@( posedge clk)
begin
	if (opcodereg==4'b1101 && curstate==3'b010) begin
		$display("State 3a");
		//curstate=3'b011;
		w1=1'b1;
		w2=1'b0;
		pcwritecond=1'b0;
		pcwrite=1'b0;
		iord=1'b0;
		memread=1'b0;
		memwrite=1'b0;
		memtoreg=2'b10;
		irwrite=1'b0;
		A=1'b1;
		B=1'b0;
		C=3'b010;
		pcsource=2'b00;
		aluop=4'b1101;
	end
end
endmodule

/*
module testbench();

	reg clk;
	reg reset;
	reg [3:0] opcode;
	wire w1;
	wire w2;
	wire pcwritecond;
	wire pcwrite;
	wire iord;
	wire memread;
	wire memwrite;
	wire [1:0] memtoreg;
	wire irwrite;
	wire A;
	wire B;
	wire [2:0] C;
	wire [1:0] pcsource;
	wire [3:0] aluop;
	wire ccpcinit;
wire [3:0]opcodereg;

	ctrlckt ck1( clk, reset, opcode, w1, w2, pcwritecond, pcwrite, iord, memread, memwrite, memtoreg, irwrite, A, B, C, pcsource, aluop, ccpcinit,opcodereg);


	initial begin
		clk=0; reset=1;
		$monitor("----> ccpcinit=%b| w1 = %b | w2=%b| , pcwritecond=%b|, pcwrite=%b|, iord=%b|, memread=%b|, memwrite=%b|, memtoreg=%b|, irwrite=%b|, A=%b|, B=%b|, C=%b|, pcsource=%b|, aluop=%b| opcodereg=%b| ",ccpcinit, w1, w2, pcwritecond, pcwrite, iord, memread, memwrite, memtoreg, irwrite, A, B, C, pcsource, aluop,opcodereg);
		#1 reset=0;
		#2 opcode=4'b0000; 


		#500 $finish();
	end

	always begin
		#20 clk=~clk;
		end


endmodule*/

