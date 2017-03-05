module merge_step(X9,Y9,b,X17,Y17,clk);

`define WIDTH 22
input clk;
input  	[`WIDTH-1:0] X9;
input  	[`WIDTH-1:0] Y9;
input    [7:0] b;
output reg [`WIDTH-1:0] X17;
output reg [`WIDTH-1:0] Y17;
wire [`WIDTH-1:0] tmpX10;
wire [`WIDTH-1:0] tmpX11;
wire [`WIDTH-1:0] tmpX12;
wire [`WIDTH-1:0] tmpX13;
wire [`WIDTH-1:0] tmpX14;
wire [`WIDTH-1:0] tmpX15;
wire [`WIDTH-1:0] tmpX16;
wire [`WIDTH-1:0] tmpX17;


wire [`WIDTH-1:0] tmpY10;
wire [`WIDTH-1:0] tmpY11;
wire [`WIDTH-1:0] tmpY12;
wire [`WIDTH-1:0] tmpY13;
wire [`WIDTH-1:0] tmpY14;
wire [`WIDTH-1:0] tmpY15;
wire [`WIDTH-1:0] tmpY16;
wire [`WIDTH-1:0] tmpY17;



//
//merge Y
merge_loc #(.shift_num(9))
        M1 (.A_in(Y9),.b(b[7]),.A_out(tmpY10),.clk(clk));
merge_loc #(.shift_num(10))
        M2 (.A_in(Y9),.b(b[6]),.A_out(tmpY11),.clk(clk));
merge_loc #(.shift_num(11))
        M3 (.A_in(Y9),.b(b[5]),.A_out(tmpY12),.clk(clk));
merge_loc #(.shift_num(12))
        M4 (.A_in(Y9),.b(b[4]),.A_out(tmpY13),.clk(clk));
merge_loc #(.shift_num(13))
        M5 (.A_in(Y9),.b(b[3]),.A_out(tmpY14),.clk(clk));
merge_loc #(.shift_num(14))
        M6 (.A_in(Y9),.b(b[2]),.A_out(tmpY15),.clk(clk));
merge_loc #(.shift_num(15))
        M7 (.A_in(Y9),.b(b[1]),.A_out(tmpY16),.clk(clk));
merge_loc #(.shift_num(16))
        M8 (.A_in(Y9),.b(b[0]),.A_out(tmpY17),.clk(clk));

//merge X
merge_loc #(.shift_num(9))
        M9 (.A_in(X9),.b(b[7]),.A_out(tmpX10),.clk(clk));
merge_loc #(.shift_num(10))
        M10 (.A_in(X9),.b(b[6]),.A_out(tmpX11),.clk(clk));
merge_loc #(.shift_num(11))
        M11 (.A_in(X9),.b(b[5]),.A_out(tmpX12),.clk(clk));
merge_loc #(.shift_num(12))
        M12 (.A_in(X9),.b(b[4]),.A_out(tmpX13),.clk(clk));
merge_loc #(.shift_num(13))
        M13 (.A_in(X9),.b(b[3]),.A_out(tmpX14),.clk(clk));
merge_loc #(.shift_num(14))
        M14 (.A_in(X9),.b(b[2]),.A_out(tmpX15),.clk(clk));
merge_loc #(.shift_num(15))
        M15 (.A_in(X9),.b(b[1]),.A_out(tmpX16),.clk(clk));
merge_loc #(.shift_num(16))
        M16 (.A_in(X9),.b(b[0]),.A_out(tmpX17),.clk(clk));


//sum X17,Y17

always @(*)begin
  if(X17>=22'b0111111111111111111111)
    X17<=22'b0111111111111111111111;
  end

always @(X9 or Y9) begin
	 X17<=X9-tmpY10-tmpY11-tmpY12-tmpY13-tmpY14-tmpY15-tmpY16-tmpY17;
	 Y17<=Y9+tmpX10+tmpX11+tmpX12+tmpX13+tmpX14+tmpX15+tmpX16+tmpX17;

  // $display("X17=%d,Y17=%d",X17,Y17);

end
endmodule
