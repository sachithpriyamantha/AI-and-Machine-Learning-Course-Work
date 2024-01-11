load fisheriris.mat
x = cvpartition(species,'HoldOut',0.4);
trainData = meas(training(x),:);
trainTarget = species(training(x));
testData = meas(test(x),:);
testTarget = species(test(x));
y = [5, 7];
for i = 1:length(y)
 Mdl = fitcknn(trainData,trainTarget,'NumNeighbors',y(i));
 predictions = predict(Mdl, testData);
 confusionmatrix = confusionmat(testTarget,predictions);
 accuracy = sum(diag(confusionmatrix)) / sum(confusionmatrix,'all');
 % Display
 fprintf('\nConfusion Matrix for K = %d:\n',y(i));
 disp(confusionmatrix);
 fprintf('Accuracy for K = %d is %.2f%%\n',y(i),accuracy*100);
end