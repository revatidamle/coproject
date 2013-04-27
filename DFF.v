module DFF( input D ,input D1 ,output reg Q, input Write,input Write1, input Clk);
	always@(negedge Clk) 
	begin
	if(Write)
		begin
		Q=D;
		end
	else if(Write1)
		begin
		Q=D1;
		end
	else
		Q=Q;
	end
endmodule
