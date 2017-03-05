module adder(Fcw,clk,rst_n,out);
input [35:0] Fcw;
input  clk;
input  rst_n;
output reg [35:0] out;


always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                      out<=0;

                end
                else begin


                	out=out+Fcw;
                	 
                end
            end
endmodule