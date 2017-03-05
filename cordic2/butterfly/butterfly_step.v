module butterfly_step(X5,Y5,clk,b,rst_n,X9,Y9);
`define WIDTH 22

input  	[`WIDTH-1:0] X5;
input  	[`WIDTH-1:0] Y5;
input    [3:0] b;
input clk,rst_n;
output  [`WIDTH-1:0] X9;
output   [`WIDTH-1:0] Y9;

wire  	[`WIDTH-1:0] X6;
wire 	[`WIDTH-1:0] Y6;
wire  	[`WIDTH-1:0] X7;
wire 	[`WIDTH-1:0] Y7;
wire  	[`WIDTH-1:0] X8;
wire 	[`WIDTH-1:0] Y8;


butterfly_loc
   #(.shift_num(5))
   U1
(.X_in(X5),.Y_in(Y5),.b(b[3]),.clk(clk),.rst_n(rst_n),.X_out(X6),.Y_out(Y6));


butterfly_loc
   #(.shift_num(6))
   U2
(.X_in(X6),.Y_in(Y6),.b(b[2]),.clk(clk),.rst_n(rst_n),.X_out(X7),.Y_out(Y7));

butterfly_loc
   #(.shift_num(7))
   U3
(.X_in(X7),.Y_in(Y7),.b(b[1]),.clk(clk),.rst_n(rst_n),.X_out(X8),.Y_out(Y8));


butterfly_loc
   #(.shift_num(8))
   U4
(.X_in(X8),.Y_in(Y8),.b(b[0]),.clk(clk),.rst_n(rst_n),.X_out(X9),.Y_out(Y9));




endmodule