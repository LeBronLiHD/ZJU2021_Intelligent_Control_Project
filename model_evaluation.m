function model_evaluation(imdsTest, width, height, mode)

augmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandRotation',[-30 30],...
    'RandXScale',[1 4], ...
    'RandYReflection',true, ...
    'RandYScale',[1 4]);

if mode == 1
    load('FlowerCNNNet.mat', 'FlowerNet');
end
if mode == 2
    load('FlowerAlexNet.mat', 'FlowerNet');
end
    
imageSize = [width, height, 3];
imdsTest_rsz = augmentedImageDatastore(imageSize,...
    imdsTest,...
    'DataAugmentation', augmenter);
YPred = classify(FlowerNet, imdsTest_rsz);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest);
disp("accuracy = " + num2str(accuracy, 32));


% show 25 images randomly
Name = "Init_Name";
if mode == 1
    Name = "CNN_25_pred";
end
if mode == 2
    Name = "Alex_25_pred";
end
f = figure('Name', Name);
f.Position = [400 40 700 700]; 
idx = randperm(length(imdsTest_rsz.Files),25);
for i = 1:25
    subplot(5,5,i);
    I = readimage(imdsTest,idx(i));
    label = YPred(idx(i));
    imshow(I);
    title(char(label));
end

% show 5 images randomly with confidence
if mode == 1
    Name = "CNN_9_pred_and_conf";
end
if mode == 2
    Name = "Alex_9_pred_and_conf";
end
f = figure('Name', Name);
f.Position = [400 40 700 700]; 
idx_9 = randperm(length(imdsTest_rsz.Files), 9);
for i = 1:9
    subplot(3,3,i);
    image = readimage(imdsTest,idx_9(i));
    [Pred,scores] = classify(FlowerNet, image);
    scores = max(double(scores*100));
    imshow(image);
    title(join([string(Pred),' ' ,scores ,'%']))
end

end