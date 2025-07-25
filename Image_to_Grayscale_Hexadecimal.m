clc
clear all

img=imread("C:\Users\xxxxxxxxxx\yyyyyyyyyy\matlabforfpga\nando-jpeg-quality-001.jpg"); % Replace with the path of the target image stored on your system

img=rgb2gray(img);
[height, width, ~] = size(img);
% Initialize an array to store hex values
imghexgray = strings(height, width);

% Loop through each pixel and convert RGB to hex
for i = 1:height
    for j = 1:width
        % Extract values for the current pixel
        gray = img(i, j);

        % Convert channel to 2-character hex
        hexgray = dec2hex(gray, 2);

        % Combine into a 6-character hex value
        imghexgray(i+1,j+1) = hexgray;
    end
end

writematrix(imghexgray,'grayimg.txt','Delimiter',' '); % Grayscale Bytes in txt file
type grayimg.txt
