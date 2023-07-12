module bist(input clk,
            input rst,
            input [15:0] a,
            input [15:0] b,
            input tm,
            output [31:0] tp,
            output [16:0] ao,
            output [16:0] oro);
    wire [15:0] c,d;
    wire p;
    assign {d[15:0],c[15:0]}=tm?tp:{b[15:0],a[15:0]};
    ca c1(clk,rst,tp);
    bcd_add b1(c,d,0,ao);
    ora o1(clk,rst,ao,oro);
endmodule
