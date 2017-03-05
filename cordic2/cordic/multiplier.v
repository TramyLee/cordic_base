module multiplier(in,out,clk);
input [18:0] in;
input clk;
output reg [15:0] out;
 reg [21:0] tmp;
 reg [21:0] tmp1;
 reg [21:0] tmp2;
 reg [21:0] tmp3;
 reg [21:0] tmp4;
 reg [21:0] tmp5;
always @(in or posedge clk) begin
	tmp1<={in[18:0],3'b000}>>1;
	tmp2<={in[18:0],3'b000}>>2;
	tmp3<={in[18:0],3'b000}>>5;
	tmp4<={in[18:0],3'b000}>>8;
	tmp5<={in[18:0],3'b000}>>12;
	tmp<=tmp1+tmp2+tmp3+tmp4+tmp5;
	out<=tmp[21:6];
end
endmodule