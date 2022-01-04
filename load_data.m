function imds = load_data(folder_name, show_image)

imds = imageDatastore(folder_name,...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

if show_image == true
    f = figure('Name', 'show 25 original images');
    f.Position = [400 40 700 700]; 
    numImages = length(imds.Files);
    perm = randperm(numImages,25);
    for i = 1:25
        subplot(5,5,i);
        imshow(imds.Files{perm(i)});
        drawnow
    end
end

disp("load data done!");

end