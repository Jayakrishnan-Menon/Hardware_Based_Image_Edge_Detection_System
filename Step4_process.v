module process;

reg clk, clk1, clk2;
integer fptr1, fptr2;
integer i, j;
reg [7:0] din;
wire [7:0] dou;
wire [1:0] stat;
reg dlay;

initial begin 
    // Open files
    fptr1 = $fopen("grayimg.txt", "r");
    fptr2 = $fopen("edgeout.txt", "w");
    clk = 1;
    #100
    forever #1 clk = ~clk;
    dlay=1'bz;
end

// Input/Output file handling
initial begin
    // Read input image and write output
    dlay=1;
    for (i = 0; i < 600; i = i + 1) begin      //rows or height
        for (j = 0; j < 800; j = j + 1) begin  //cols or width
            @(posedge clk)begin
            $fscanf(fptr1, "%h", din);
            //$fwrite(fptr2, "%h ", dou);
            end
        end
        //$fwrite(fptr2, "\n");
    end

    dlay=0;
    for (i = 0; i < 600; i = i + 1) begin
        for (j = 0; j < 800; j = j + 1) begin
            @(posedge clk)begin
                  $fwrite(fptr2, "%h ", dou);

            end
        end
          $fwrite(fptr2, "\n");
    end
    dlay=1'bz;
    // Close files
    $fclose(fptr1);
    $fclose(fptr2);
    $finish;
end

// Instantiate your image processing module
imageprocessor imggg(
    .dlay(dlay),
    .clk(clk),
    .din(din),
    .dou(dou)
);

endmodule
