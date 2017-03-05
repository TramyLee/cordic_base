module out_put(X17,Y17,MSB,cos,sin,clk);
`define WIDTH 22
input  	[`WIDTH-1:0]  X17;
input  	[`WIDTH-1:0]  Y17;
input clk;
input [2:0] MSB;
output reg[15:0]  cos;//一位为符号位
output reg [15:0]  sin;
	always @(posedge clk) begin
		case(MSB)
		3'b000:begin
			cos<=X17[21:6];
			sin<=Y17[21:6];
		end
		3'b001:begin
			cos<=Y17[21:6];
			sin<=X17[21:6];
		end
		3'b010:begin
			
			cos<=-Y17[21:6];//1表示符号位
			sin<=X17[21:6];

		end
		3'b011:begin
			cos<=-X17[21:6];
			sin<=Y17[21:6];
		end
		3'b100:begin
			cos<=-X17[21:6];
			sin<=-Y17[21:6];
		end
		3'b101:begin
			cos<=-Y17[21:6];
			sin<=-X17[21:6];
		end
		3'b110:begin
			cos<=Y17[21:6];
			sin<=-X17[21:6];
		end
		3'b111:begin
			cos<=X17[21:6];
			sin<=-Y17[21:6];
		end
	endcase
	end
	
	
	endmodule