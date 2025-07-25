//Intended to take the image input as 1 piece and output as 1 piece
//It calls the sobel filter in between to do the processing

module imageprocessor(input clk, dlay, input [7:0]din, output reg [7:0]dou);
parameter rows = 600, cols = 800; //change based on image
reg [7:0]p0,p1,p2,p3,p5,p6,p7,p8;
wire[7:0]magval;
reg [7:0] min [0:rows+1][0:cols+1];
reg [7:0] mou [0:rows-1][0:cols-1];
integer i,j;
reg clk1;

initial begin 
dou = 8'b00000000;
p0 = 8'b00000000;
p1 = 8'b00000000;
p2 = 8'b00000000;
p3 = 8'b00000000;
p5 = 8'b00000000;
p6 = 8'b00000000;
p7 = 8'b00000000;
p8 = 8'b00000000;
clk1=0;

for(i=0;i<rows+2;i=i+1)begin 
for(j=0;j<cols+2;j=j+1)begin 
min[i][j]=8'b00000000;
end
end
end

always@(*)begin //Input here
if(dlay==1'b1)begin
for(i=1;i<rows+1;i=i+1)begin 
for(j=1;j<cols+1;j=j+1)begin 
@(posedge clk)begin
min[i][j]=din;
end
end
end
end
end

always@(*)begin
if(dlay==1'b0)begin
for(i=1;i<rows+1;i=i+1)begin 
for(j=1;j<cols+1;j=j+1)begin 
@(posedge clk)begin
p0 = min[i-1][j-1]; p1 = min[i-1][j+0]; p2 = min[i-1][j+1]; 
p3 = min[i+0][j-1];                     p5 = min[i+0][j+1]; 
p6 = min[i+1][j-1]; p7 = min[i+1][j+0]; p8 = min[i+1][j+1]; 
dou = magval;
mou[i-1][j-1] = dou; //[i][j];
end
end
end
end
end

sobelmag sobmg(clk,p0,p1,p2,p3,p5,p6,p7,p8, magval);

endmodule
