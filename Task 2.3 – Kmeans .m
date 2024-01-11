load kmeansdata.mat
rng default;
% randomly generated data
data = [randn(100, 2) * 0.75 + ones(100, 2);
 randn(100, 2) * 0.5 - ones(100, 2)];
% k-means clustering for k=5
k = 5;
[a,c,d] = kmeans(data,k);
[sil_val,x] = silhouette(data,a,'sqEuclidean');
% Plot silhouette values
xlabel('Silhouette Value');
ylabel('Cluster');
title(['Clusters = ' int2str(k)]);
% Display mean silhouette value
mean_sil = mean(sil_val);
disp(['Mean : ' num2str(mean_sil)]);
% Reporting the best number of clusters based on silhouette values
[bestSilhouette, bestIdx] = max(mean_sil);
bestK = K_values(bestIdx);
fprintf('The best number of clusters is %d with a silhouette value of %.2f\n', bestK,
bestSilhouette);
% Loop for K=3
k=bestK;
[h,i,~] = kmeans(data,k);
% Plot clusters and centroids for K=3
figure;
gscatter(data(:,1), data(:,2),h, 'rbg', '...', 13);
hold on;
plot(i(:,1),i(:, 2),'kx', 'MarkerSize',15, 'LineWidth',3);
legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','best');
title(['Cluster and Cluster Centroids, K=' num2str(k)]);
xlabel('x-value');
ylabel('y-value');
hold off;
% Mean performance using silhouette measure for K=3
sil = silhouette(data,h);
mean_sil = mean(sil);
fprintf('Mean for K = %d is %.5f\n', k,mean_sil);