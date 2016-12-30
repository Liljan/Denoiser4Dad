% clean-up
clc;
clear all;

files = dir('*.jpg');

for n = 1: length(files)

    image = imread(files(n).name);
    image = rgb2gray(image);

    [width,height] = size(image);

    output = image;

    % 50 - f�r l�gt
    % 100 - lite f�r h�gt
    % 150 - f�r h�gt
    threshold = 90;

    for x = 1:width
        for y = 1:height
            if image(x,y) > threshold
                output(x,y) = 255;
            end
        end
    end

    name = strcat('output_',files(n).name);
    imwrite(output,name);
end