load fisheriris.mat
% Shuffle the dataset
a = cvpartition(species, 'HoldOut', 0.4);
trainData = meas(training(a),:);
trainTarget = species(training(a));
testData = meas(test(a),:);
testTarget = species(test(a));
% Define hidden layer sizes
HiddenLayerSizes = [10, 15, 20];
for i = 1:length(HiddenLayerSizes)

 % Create a feedforward neural network
 x = feedforwardnet(HiddenLayerSizes(i));
 % Train the network
 [x, tr] = train(x,trainData',dummyvar(categorical(trainTarget))');
 % Test the network
 prediction = x(testData');
 [x, predictedClasses] = max(prediction);
 actualClasses = grp2idx(categorical(testTarget));
 accuracy = sum(predictedClasses == actualClasses') / numel(actualClasses);
 % Display the accuracy
 disp(['Accuracy for ', num2str(HiddenLayerSizes(i)), ' Hidden Layers: ',
num2str(accuracy * 100), '%'])
end