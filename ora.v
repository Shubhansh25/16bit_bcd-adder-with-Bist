//ORA

module ora(input clk,input rst,input [16:0] o,output [16:0] q);
  genvar i;
  generate
    
      for(i=16;i>=0;i=i-1) 
      begin:gen_loop
          if(i==16||i==0) begin
          dff a(clk,rst,(o[i]^q[0]),q[i]);
        end
        else begin
          dff a(clk,rst,(o[i]^q[0]^q[i-1]),q[i]);
        end
      end
  endgenerate
endmodule
