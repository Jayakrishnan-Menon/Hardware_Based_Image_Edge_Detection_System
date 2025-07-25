module sobelmag(input clk, input [7:0]p0,p1,p2,p3,p5,p6,p7,p8, output reg [7:0]magval);
reg [10:0]xval,yval;
reg [9:0]trval;
reg [10:0]sum1,sum2,sum3,sum4,p33,p55,p11,p77;

initial begin xval=11'b00000000000; yval=11'b00000000000; end
always@(posedge clk) begin 
magval=8'bxxxxxxxx;
p33=p3<<1;
p55<=p5<<1;
sum1=p0+p33+p6;
sum2<=p2+p55+p8;

p11=p1<<1;
p77<=p7<<1;
sum3=p0+p11+p2;
sum4<=p6+p77+p8;

xval=sum2-sum1;
yval<=sum4-sum3;

//x mag
if(xval[10]==1'b1) begin 
xval=~xval;
xval=xval+1'b1;
end
//y mag
if(yval[10]==1'b1) begin 
yval=~yval;
yval=yval+1'b1;
end

trval=xval[9:0]+yval[9:0];
magval <= trval[9:2]; //try 9:2 and 7:0 also 
//(7:0 is very detailed but noisy ad lines are coarse)
//(8:1 is good enough, in between)
//(9:2 is less detailed, less noisy, but lines are smoother)
end                   
endmodule
