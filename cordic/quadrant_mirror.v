module quarant_mirror(in,MSB3,out,clk);

input [18:0] in;
input clk;
input MSB3;
output reg [18:0] out;


always @(posedge clk)begin
	if(MSB3==1'b0)begin
		out<=in;
	end
	else begin
		out<=(~in)+1'b1;//    pi/2-in;
		
	end
end

endmodule
