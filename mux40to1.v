module mux40to1(input [15:0] outselect,
	input [7:0] in1,input [7:0] in2,input [7:0] in3,input [7:0] in4,input [7:0] in5,
	input [7:0] in6,input [7:0] in7,input [7:0] in8,input [7:0] in9,input [7:0] in10,
	input [7:0] in11,input [7:0] in12,input [7:0] in13,input [7:0] in14,input [7:0] in15,
	input [7:0] in16,input [7:0] in17,input [7:0] in18,input [7:0] in19,input [7:0] in20,
	input [7:0] in21,input [7:0] in22,input [7:0] in23,input [7:0] in24,input [7:0] in25,
	input [7:0] in26,input [7:0] in27,input [7:0] in28,input [7:0] in29,input [7:0] in30,
	input [7:0] in31,input [7:0] in32,input [7:0] in33,input [7:0] in34,input [7:0] in35,
	input [7:0] in36,input [7:0] in37,input [7:0] in38,input [7:0] in39,input [7:0] in40,
	output reg [7:0] muxout);

	always@(outselect,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40)
	begin
	case(outselect)
	16'b0000000000000000:muxout=in1;
	16'b0000000000000001:muxout=in2;
	16'b0000000000000010:muxout=in3;
	16'b0000000000000011:muxout=in4;
	16'b0000000000000100:muxout=in5;
	16'b0000000000000101:muxout=in6;
	16'b0000000000000110:muxout=in7;
	16'b0000000000000111:muxout=in8;
	16'b0000000000001000:muxout=in9;
	16'b0000000000001001:muxout=in10;
	16'b0000000000001010:muxout=in11;
	16'b0000000000001011:muxout=in12;
	16'b0000000000001100:muxout=in13;
	16'b0000000000001101:muxout=in14;
	16'b0000000000001110:muxout=in15;
	16'b0000000000001111:muxout=in16;
	16'b0000000000010000:muxout=in17;
	16'b0000000000010001:muxout=in18;
	16'b0000000000010010:muxout=in19;
	16'b0000000000010011:muxout=in20;
	16'b0000000000010100:muxout=in21;
	16'b0000000000010101:muxout=in22;
	16'b0000000000010110:muxout=in23;
	16'b0000000000010111:muxout=in24;
	16'b0000000000011000:muxout=in25;
	16'b0000000000011001:muxout=in26;
	16'b0000000000011010:muxout=in27;
	16'b0000000000011011:muxout=in28;
	16'b0000000000011100:muxout=in29;
	16'b0000000000011101:muxout=in30;
	16'b0000000000011110:muxout=in31;
	16'b0000000000011111:muxout=in32;
	16'b0000000000100000:muxout=in33;
	16'b0000000000100001:muxout=in34;
	16'b0000000000100010:muxout=in35;
	16'b0000000000100011:muxout=in36;
	16'b0000000000100100:muxout=in37;
	16'b0000000000100101:muxout=in38;
	16'b0000000000100110:muxout=in39;
	16'b0000000000100111:muxout=in40;
	//16'b0000000000101000:muxout=in40;
	endcase
	end
endmodule
