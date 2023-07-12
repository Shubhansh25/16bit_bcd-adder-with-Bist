//CUT
module bcd_add ( 
    input [15:0] a, b,
    input cin,
    output [16:0] sum );
    wire carry[3:0];
    genvar i;
    bcd q1(a[3:0],b[3:0],cin,carry[0],sum[3:0]);
    generate for (i=2;i<=4;i=i+1)
        begin:bcd_add
            bcd p1(a[4*i-1:4*(i-1)],b[4*i-1:4*(i-1)],carry[i-2],carry[i-1],sum[4*i-1:4*(i-1)]);
        end
            endgenerate
    assign sum[16]=carry[3];
endmodule
module bcd(input [3:0]a,b,
           input cin,
           output carry,
           output  [3:0]sum);
  wire [3:0] sum1;
    
    wire carry1,carry2;
    assign {carry1,sum1}=a+b+cin;
  
    assign {carry2,sum}=(carry1)|(sum1[3]&sum1[2] | sum1[3]&sum1[1])? (sum1+4'b0110):sum1;
    assign carry =carry1|carry2|1'b0;
  //  assign {carry,sum}=(carry1)|(sum>9)? (sum1+4'b0110):sum1;
    
endmodule
