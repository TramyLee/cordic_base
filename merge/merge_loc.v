module  merge_loc
        #(parameter shift_num=9)
(A_in,b,A_out,clk);
`define WIDTH 22
//shift 
input  	[`WIDTH-1:0] A_in;
input clk;
input    b;
output reg [`WIDTH-1:0] A_out;

/*
*r_k=2b_k-1-1 k=9..16
*/
always @(posedge clk)
begin
        if (b==1'b1) begin//b[k-1]==1 r[k]=1
                A_out=A_in>>shift_num;
                

        end
        else begin
                 A_out=~(A_in>>shift_num)+1;
                
        end
end




endmodule
