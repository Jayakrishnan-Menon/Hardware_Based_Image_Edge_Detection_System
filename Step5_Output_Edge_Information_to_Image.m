clc 
clear all
filename = "C:\Users\xxxxxxxxxx\yyyyyyyyyy\edgeout.txt"; % Replace with the path of the processed text file stored on your system

% Open file
FID = fopen(filename);
datafromfile = textscan(FID, '%s');  % read as strings
fclose(FID);

% Extract the actual cell array
data = datafromfile{1};

% Replace any invalid entries like 'xx', 'xxxxxxxx', etc. with '00'
for i = 1:length(data)
    if isempty(regexp(data{i}, '^[0-9A-Fa-f]{1,2}$', 'once'))
        data{i} = '00';  % Replace with black pixel
    end
end

% Convert hex strings to decimal uint8
decData = uint8(hex2dec(data));

% Optional: reshape if you know the image dimensions
rows = 600;
cols = 800;

if numel(decData) ~= rows * cols
    warning('Pixel count mismatch: expected %d, got %d', rows*cols, numel(decData));
end

img = reshape(decData, [cols, rows])';  % transpose for row-major
figure
imshow(img, []);
title('Edge-detected Image');

% Save image if needed
imwrite(img, 'edge_output_image.png');

