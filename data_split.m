function [imdsTrain, imdsValid, imdsTest] = data_split(imds)

% 0.7 0.15 0.15
[imdsTrainValid, imdsTest] = splitEachLabel(imds, 0.85, 'randomize');
[imdsTrain, imdsValid] = splitEachLabel(imdsTrainValid, ...
    (0.70/0.85), ...
    'randomize');

end