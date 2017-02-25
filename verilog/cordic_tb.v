module cordic_tb;
	wire [15:0] sin;
	wire [15:0] cos;
	reg  [15:0] deg;
	reg clk;
	reg rst_n;
	cordic U1(.deg(deg),.clk(clk),.rst_n(rst_n),.sin(sin),.cos(cos));
	initial begin
		deg=0;
		clk=0;
		
		rst_n=1'b1;
		#30 rst_n=1'b0;
		#30 rst_n=1'b1;
	end
always
   #5 clk=!clk;


	always @(posedge clk)
	begin
		deg<=deg+1'b1;
	end

		
	
initial begin
$monitor($time,"sin(deg)=%d;cos(deg)=%d",sin,cos);
end



endmodule