function layers = cnn_model(width, height)

imageSize = [width, height, 3];
layers = [ ...
    imageInputLayer(imageSize,'Name','Input')  
    
    convolution2dLayer(3,16,'Padding','same', 'Name','Conv_1')
    batchNormalizationLayer('Name','BatchNor_1')
    reluLayer('Name','relu_1')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_1')
    
    convolution2dLayer(3,32,'Padding','same', 'Name','Conv_2')
    batchNormalizationLayer('Name','BatchNor_2')
    reluLayer('Name','relu_2') 
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_2')
    
    convolution2dLayer(3,64,'Padding','same', 'Name','Conv_3')
    batchNormalizationLayer('Name','BatchNor_3')
    reluLayer('Name','relu_3')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_3')
    
    convolution2dLayer(3,64,'Padding','same', 'Name','Conv_4')
    batchNormalizationLayer('Name','BatchNor_4')
    reluLayer('Name','relu_4')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_4')
    
    convolution2dLayer(3,128,'Padding','same', 'Name','Conv_5')
    batchNormalizationLayer('Name','BatchNor_5')
    reluLayer('Name','relu_5')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_5')
    
    convolution2dLayer(3,128,'Padding','same', 'Name','Conv_6')
    batchNormalizationLayer('Name','BatchNor_6')
    reluLayer('Name','relu_6')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_6')
    
    fullyConnectedLayer(128,'Name','Full_1')
    reluLayer('Name','relu_7')
    
    fullyConnectedLayer(64,'Name','Full_2')
    reluLayer('Name','relu_8')
    
    fullyConnectedLayer(32,'Name','Full_3')
    reluLayer('Name','relu_9')
    
    fullyConnectedLayer(16,'Name','Full_4')
    fullyConnectedLayer(4,'Name','Full_5')
    softmaxLayer('Name','softmax_1')
    
    classificationLayer('Name','Output') ];

lgraph = layerGraph(layers);
figure;
plot(lgraph);

disp("cnn model construction done!");

end