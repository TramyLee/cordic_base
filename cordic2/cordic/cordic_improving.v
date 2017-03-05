module cordic_improving(Fcw,clk,rst_n,sin,cos);

input clk;
input rst_n;
input [35:0] Fcw;
wire [35:0] phi;
wire [21:0] phi1;
reg [21:0] phi1_1,phi1_2,phi1_3,phi1_4;
wire [18:0] phi2;
wire [15:0] b;
wire [21:0] X5,Y5,X9,Y9,X17,Y17;
output [15:0] sin,cos;



//step1 adder output phi [35:0];
adder  U1 (.Fcw(Fcw),.clk(clk),.rst_n(rst_n),.out(phi));
assign phi1 =phi[35:14] ;//hight 22


//step2 quadrant mirror phi2 [18:0]
quarant_mirror U2(.in(phi1[18:0]),.MSB3(phi1[19]),.out(phi2),.clk(clk));



//step3 multiplier b [15:0]
multiplier U3(.in(phi2),.out(b),.clk(clk));


//step4  rom X5 Y5 [21:0]
 cordic_rom  U4(
	.address(b[15:12]),
	.X5(X5),
	.Y5(Y5),.clk(clk));


//step6  butter_fly
butterfly_step U6(.X5(X5),.Y5(Y5),.clk(clk),.b(b[11:8]),.rst_n(rst_n),.X9(X9),.Y9(Y9));

 


//step7 merge

merge_step U7(.X9(X9),.Y9(Y9),.b(b[7:0]),.X17(X17),.Y17(Y17),.clk(clk));

//step8 output
out_put U8(.X17(X17),.Y17(Y17),.MSB(phi1_4[21:19]),.cos(cos),.sin(sin),.clk(clk));





always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                       // phi1<=0;
                        phi1_1<=0;
                        phi1_2<=0;
                        phi1_3<=0;
                        phi1_4<=0;    
                end
                else begin
                	phi1_1<=phi1;
                	phi1_2<=phi1_1;
                	phi1_3<=phi1_2;
                	phi1_4<=phi1_3;
                	
  
      	
                end
            end

endmodule



