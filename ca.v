//tpg
module ca(input clk,input rst,output reg [31:0] q);
    dff a (clk,rst,(q[1]^q[0]),q[0]);
    genvar i;
    generate for (i=1;i<16;i=i+1)
        begin:d_ff
            dff b(clk,rst,(q[2*i-2]^q[2*i]),q[2*i-1]);
            dff E(clk,rst,(q[2*i-1]^q[2*i]^q[2*i+1]),q[2*i]);
        end
    endgenerate
  
    dff c(clk,rst,(q[30]),q[31]);
endmodule
