module ALU(input[3:0] aluop, input[15:0] A, input[15:0] B, input[15:0] C, output reg [15:0] LO, output reg[15:0] HI, output reg NZ);

	wire[15:0] out1; wire[15:0] out2;
	always @ (aluop,A,B,C) begin
		//HI=0;
		NZ=0;
		case(aluop)
			4'b0000: LO=A+B+C;
			4'b0001: LO=A-B-C;
			4'b0010: LO=A+B-C;
			4'b0011: begin
						LO=B/C; 
						HI=B%C;
					 end
			4'b0100: LO=A+B+C;
			4'b0101: LO=A<<C;
			4'b0110: LO=A>>C;
			4'b0111: LO=$signed(A)>>C;
			4'b1000: LO=C+A;
			4'b1001: LO=C+A;
			4'b1010: begin
						if (A!=B)
							NZ=1;
						end
			4'b1011: LO = A|C;
			4'b1100: LO = A+C; 
			4'b1101: LO = B+C; //JALR
			4'b1111: LO = A+B;
		endcase
	end

endmodule
