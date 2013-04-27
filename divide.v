module divide(input[15:0] in1, input[15:0] in2, output wire[15:0] a, output wire[15:0] b);	

	//wire[3:0] a; wire[3:0] b;
	assign a=in1/in2;
	assign b=in1%in2;
	

endmodule

/*
module testbench();
	reg[15:0] i1,i2;
	wire[15:0] out1,out2;

	divide d1 (i1,i2,out1,out2);
	initial begin
		$monitor($time,"in1=%d | in2=%d | out1=%d | out2=%d",i1,i2,out1,out2);
		i1=8; 
		i2=3;
		#10 i1=15; i2=7;
	end
endmodule 		

*/