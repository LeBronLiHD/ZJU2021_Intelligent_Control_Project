function layers = alex_net()

alex = alexnet;
layers = alex.Layers;
% change the number of classes
layers(23) = fullyConnectedLayer(4, 'Name','Full_4');
layers(25) = classificationLayer('Name','Output');

lgraph = layerGraph(layers);
figure;
plot(lgraph);

disp("alex model construction done!");

end