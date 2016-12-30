% clean-up
clc;
clear all;

files = dir('*.jpg');

for n = 1: length(files)

    image = imread(files(n).name);
    image = rgb2gray(image);

    [width,height] = size(image);

    output = image;

    % 50 - för lågt
    % 100 - lite för högt
    % 150 - för högt
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