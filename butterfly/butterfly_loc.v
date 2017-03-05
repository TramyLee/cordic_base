module butterfly_loc
   #(parameter shift_num=8)
(X_in,Y_in,b,clk,rst_n,X_out,Y_out);
 
`define WIDTH 22
input  	[`WIDTH-1:0] X_in;
input   [`WIDTH-1:0] Y_in;
input   b;
input clk;   
input rst_n;
output  reg [`WIDTH-1:0] X_out;
output  reg [`WIDTH-1:0] Y_out;

/*
*four butterfly_step;
*/
always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                        X_out<=0;
                        Y_out<=0;
                end
                else begin
                        if(b==1'b1) begin
                                X_out<=X_in-(Y_in>>shift_num);
                                Y_out<=Y_in+(X_in>>shift_num);
                               
                        end

                        else begin
                                X_out<=X_in+(Y_in>>shift_num);
                                Y_out<=Y_in-(X_in>>shift_num);
                              
                        end
                end
	end

endmodule
