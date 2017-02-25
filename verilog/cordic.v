module cordic(deg,clk,rst_n,sin,cos);
	`define WIDTH 16

	input [`WIDTH-1:0] deg;
    input clk;   
    input rst_n;
    output reg [`WIDTH-1:0] sin;
    output reg [`WIDTH-1:0] cos;

    reg [1:0] quadrant [`WIDTH-1:0];

    reg [`WIDTH-1:0] x0;
	reg [`WIDTH-1:0] y0;
	reg [`WIDTH-1:0] z0;
	reg [`WIDTH-1:0] x1;
	reg [`WIDTH-1:0] y1;
	reg [`WIDTH-1:0] z1;
	reg [`WIDTH-1:0] x2;
	reg [`WIDTH-1:0] y2;
	reg [`WIDTH-1:0] z2;
	reg [`WIDTH-1:0] x3;
	reg [`WIDTH-1:0] y3;
	reg [`WIDTH-1:0] z3;
	reg [`WIDTH-1:0] x4;
	reg [`WIDTH-1:0] y4;
	reg [`WIDTH-1:0] z4;
	reg [`WIDTH-1:0] x5;
	reg [`WIDTH-1:0] y5;
	reg [`WIDTH-1:0] z5;
	reg [`WIDTH-1:0] x6;
	reg [`WIDTH-1:0] y6;
	reg [`WIDTH-1:0] z6;
	reg [`WIDTH-1:0] x7;
	reg [`WIDTH-1:0] y7;
	reg [`WIDTH-1:0] z7;
	reg [`WIDTH-1:0] x8;
	reg [`WIDTH-1:0] y8;
	reg [`WIDTH-1:0] z8;
	reg [`WIDTH-1:0] x9;
	reg [`WIDTH-1:0] y9;
	reg [`WIDTH-1:0] z9;
	reg [`WIDTH-1:0] x10;
	reg [`WIDTH-1:0] y10;
	reg [`WIDTH-1:0] z10;
	reg [`WIDTH-1:0] x11;
	reg [`WIDTH-1:0] y11;
	reg [`WIDTH-1:0] z11;
	reg [`WIDTH-1:0] x12;
	reg [`WIDTH-1:0] y12;
	reg [`WIDTH-1:0] z12;
	reg [`WIDTH-1:0] x13;
	reg [`WIDTH-1:0] y13;
	reg [`WIDTH-1:0] z13;
	reg [`WIDTH-1:0] x14;
	reg [`WIDTH-1:0] y14;
	reg [`WIDTH-1:0] z14;
	reg [`WIDTH-1:0] x15;
	reg [`WIDTH-1:0] y15;
	reg [`WIDTH-1:0] z15;

	`define rot0 16'h2000
    `define rot1 16'h12e4
    `define rot2 16'h09fb
    `define rot3 16'h0511
    `define rot4 16'h028b
    `define rot5 16'h0146
    `define rot6 16'h00a3
    `define rot7 16'h0051
    `define rot8 16'h0029
    `define rot9 16'h0014
    `define rot10 16'h000a
    `define rot11 16'h0005
    `define rot12 16'h0003
    `define rot13 16'h0001
    `define rot14 16'h0001
    `define rot15 16'h0000
	    




	





	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			x0<=0;
			y0<=0;
			z0=0;
			
		end
		else begin
			x0<=16'h4dba;
            y0<=0;
			z0<=deg[`WIDTH-3:0];
		end
	end




always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                        x1<=0;
                        y1<=0;
                        z1=0;
                end
                else
                if(z0[`WIDTH-1]==1'b0)begin
                        x1<=x0-(y0>>0);
                        y1<=y0+(x0>>0);
                        z1<=z0-`rot0;
                end
                else begin
                        x1<=x0+(y0>>0);
                        y1<=y0-(x0>>0);
                        z1<=z0+`rot0;
                end
        end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x2<=0;
                    y2<=0;
                    z2=0;
            end
            else
            if(z1[`WIDTH-1]==1'b0)begin
                    x2<=x1-(y1>>1);
                    y2<=y1+(x1>>1);
                    z2<=z1-`rot1;
            end
            else begin
                    x2<=x1+(y1>>1);
                    y2<=y1-(x1>>1);
                    z2<=z1+`rot1;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x3<=0;
                    y3<=0;
                    z3=0;
            end
            else
            if(z2[`WIDTH-1]==1'b0)begin
                    x3<=x2-(y2>>2);
                    y3<=y2+(x2>>2);
                    z3<=z2-`rot2;
            end
            else begin
                    x3<=x2+(y2>>2);
                    y3<=y2-(x2>>2);
                    z3<=z2+`rot2;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x4<=0;
                    y4<=0;
                    z4=0;
            end
            else
            if(z3[`WIDTH-1]==1'b0)begin
                    x4<=x3-(y3>>3);
                    y4<=y3+(x3>>3);
                    z4<=z3-`rot3;
            end
            else begin
                    x4<=x3+(y3>>3);
                    y4<=y3-(x3>>3);
                    z4<=z3+`rot3;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x5<=0;
                    y5<=0;
                    z5=0;
            end
            else
            if(z4[`WIDTH-1]==1'b0)begin
                    x5<=x4-(y4>>4);
                    y5<=y4+(x4>>4);
                    z5<=z4-`rot4;
            end
            else begin
                    x5<=x4+(y4>>4);
                    y5<=y4-(x4>>4);
                    z5<=z4+`rot4;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x6<=0;
                    y6<=0;
                    z6=0;
            end
            else
            if(z5[`WIDTH-1]==1'b0)begin
                    x6<=x5-(y5>>5);
                    y6<=y5+(x5>>5);
                    z6<=z5-`rot5;
            end
            else begin
                    x6<=x5+(y5>>5);
                    y6<=y5-(x5>>5);
                    z6<=z5+`rot5;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x7<=0;
                    y7<=0;
                    z7=0;
            end
            else
            if(z6[`WIDTH-1]==1'b0)begin
                    x7<=x6-(y6>>6);
                    y7<=y6+(x6>>6);
                    z7<=z6-`rot6;
            end
            else begin
                    x7<=x6+(y6>>6);
                    y7<=y6-(x6>>6);
                    z7<=z6+`rot6;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x8<=0;
                    y8<=0;
                    z8=0;
            end
            else
            if(z7[`WIDTH-1]==1'b0)begin
                    x8<=x7-(y7>>7);
                    y8<=y7+(x7>>7);
                    z8<=z7-`rot7;
            end
            else begin
                    x8<=x7+(y7>>7);
                    y8<=y7-(x7>>7);
                    z8<=z7+`rot7;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x9<=0;
                    y9<=0;
                    z9=0;
            end
            else
            if(z8[`WIDTH-1]==1'b0)begin
                    x9<=x8-(y8>>8);
                    y9<=y8+(x8>>8);
                    z9<=z8-`rot8;
            end
            else begin
                    x9<=x8+(y8>>8);
                    y9<=y8-(x8>>8);
                    z9<=z8+`rot8;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x10<=0;
                    y10<=0;
                    z10=0;
            end
            else
            if(z9[`WIDTH-1]==1'b0)begin
                    x10<=x9-(y9>>9);
                    y10<=y9+(x9>>9);
                    z10<=z9-`rot9;
            end
            else begin
                    x10<=x9+(y9>>9);
                    y10<=y9-(x9>>9);
                    z10<=z9+`rot9;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x11<=0;
                    y11<=0;
                    z11=0;
            end
            else
            if(z10[`WIDTH-1]==1'b0)begin
                    x11<=x10-(y10>>10);
                    y11<=y10+(x10>>10);
                    z11<=z10-`rot10;
            end
            else begin
                    x11<=x10+(y10>>10);
                    y11<=y10-(x10>>10);
                    z11<=z10+`rot10;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x12<=0;
                    y12<=0;
                    z12=0;
            end
            else
            if(z11[`WIDTH-1]==1'b0)begin
                    x12<=x11-(y11>>11);
                    y12<=y11+(x11>>11);
                    z12<=z11-`rot11;
            end
            else begin
                    x12<=x11+(y11>>11);
                    y12<=y11-(x11>>11);
                    z12<=z11+`rot11;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x13<=0;
                    y13<=0;
                    z13=0;
            end
            else
            if(z12[`WIDTH-1]==1'b0)begin
                    x13<=x12-(y12>>12);
                    y13<=y12+(x12>>12);
                    z13<=z12-`rot12;
            end
            else begin
                    x13<=x12+(y12>>12);
                    y13<=y12-(x12>>12);
                    z13<=z12+`rot12;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x14<=0;
                    y14<=0;
                    z14=0;
            end
            else
            if(z13[`WIDTH-1]==1'b0)begin
                    x14<=x13-(y13>>13);
                    y14<=y13+(x13>>13);
                    z14<=z13-`rot13;
            end
            else begin
                    x14<=x13+(y13>>13);
                    y14<=y13-(x13>>13);
                    z14<=z13+`rot13;
            end
    end
    always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                    x15<=0;
                    y15<=0;
                    z15=0;
            end
            else
            if(z14[`WIDTH-1]==1'b0)begin
                    x15<=x14-(y14>>14);
                    y15<=y14+(x14>>14);
                    z15<=z14-`rot14;
            end
            else begin
                    x15<=x14+(y14>>14);
                    y15<=y14-(x14>>14);
                    z15<=z14+`rot14;
            end
    end







always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                        quadrant[0]<=2'b0;
                        quadrant[1]<=2'b0;
                        quadrant[2]<=2'b0;
                        quadrant[3]<=2'b0;
                        quadrant[4]<=2'b0;
                        quadrant[5]<=2'b0;
                        quadrant[6]<=2'b0;
                        quadrant[7]<=2'b0;
                        quadrant[8]<=2'b0;
                        quadrant[9]<=2'b0;
                        quadrant[10]<=2'b0;
                        quadrant[11]<=2'b0;
                        quadrant[12]<=2'b0;
                        quadrant[13]<=2'b0;
                        quadrant[14]<=2'b0;
                        quadrant[15]<=2'b0;
                end
                else begin
                        quadrant[0]<=deg[`WIDTH-1:`WIDTH-2];
                        quadrant[1]<=quadrant[0];
                        quadrant[2]<=quadrant[1];
                        quadrant[3]<=quadrant[2];
                        quadrant[4]<=quadrant[3];
                        quadrant[5]<=quadrant[4];
                        quadrant[6]<=quadrant[5];
                        quadrant[7]<=quadrant[6];
                        quadrant[8]<=quadrant[7];
                        quadrant[9]<=quadrant[8];
                        quadrant[10]<=quadrant[9];
                        quadrant[11]<=quadrant[10];
                        quadrant[12]<=quadrant[11];
                        quadrant[13]<=quadrant[12];
                        quadrant[14]<=quadrant[13];
                        quadrant[15]<=quadrant[14];
                end
        end



always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		
		
	end
	else 
	case(quadrant[15])
	 2'b00:begin 
           cos <= x15;
           sin <= y15;
           end
   2'b01:begin 
           cos <= ~(y15) + 1'b1;
          sin <= x15;
          end
  2'b10:begin 
          cos <= ~(x15) + 1'b1;
          sin <= ~(y15) + 1'b1;
          end
  2'b11:begin 
          cos <= y15;
          sin <= ~(x15) + 1'b1;
          end
    endcase
    end

    
endmodule