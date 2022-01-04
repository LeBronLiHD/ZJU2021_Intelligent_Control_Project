function resize_data(imds, width, height)

% 64*64*3

numImages = length(imds.Files);
for i = 1:numImages
    Img = imread(imds.Files{i});
    Img_resize = imresize(Img, [width, height],'nearest');
    imwrite(Img_resize, imds.Files{i});
end
disp("resize done!");

end