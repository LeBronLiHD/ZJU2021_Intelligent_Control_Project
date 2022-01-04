function main()

clear;
clc;

% basic parameters
folder_name_64 = 'Flowers_64_64';
folder_name_227 = 'Flowers_227_227';
width_64 = 64;
height_64 = 64;
width_227 = 227;
height_227 = 227;
epoch = 1500; % 1500
learning_rate = 1e-4; % 1e-4
valid_freq = 10;
alex_epoch = 50; % 1500
alex_learning_rate = 1e-3; % 1e-4
alex_valid_freq = 5;
is_resized = true;

% load images
imds_64 = load_data(folder_name_64, false);
imds_227 = load_data(folder_name_227, false);

% resize images if they are not resized
if is_resized == false
    resize_data(imds_64, width_64, height_64)
    resize_data(imds_227, width_227, height_227)
end

% split data in 0.7 0.15 0.15
[imdsTrain_64, imdsValid_64, imdsTest_64] = data_split(imds_64);
[imdsTrain_227, imdsValid_227, imdsTest_227] = data_split(imds_227);

% construst the model
layers = cnn_model(width_64, height_64);

% train cnn model with viusalization
train_model(layers,...
    imdsTrain_64, imdsValid_64, width_64, height_64,...
    epoch, learning_rate, 1, valid_freq);

% load alexnet model
alex_layers = alex_net();

% train alexnet model with viusalization
train_model(alex_layers,...
    imdsTrain_227, imdsValid_227, width_227, height_227,...
    alex_epoch, alex_learning_rate, 2, alex_valid_freq);

% evaluate two models
model_evaluation(imdsTest_64, width_64, height_64, 1);
model_evaluation(imdsTest_227, width_227, height_227, 2);

end