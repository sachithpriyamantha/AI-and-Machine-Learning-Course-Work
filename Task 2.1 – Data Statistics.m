load fisheriris.mat;
% Report N - the total number of rows (objects, cases) in data
TotalRows = size(meas, 1);
fprintf('Total number of rows (objects, cases): %d\n',TotalRows);
% For each column (feature) from 1 to 4
for a = 1:4
 % Calculate Mean
 mean_val = mean(meas(:,a));

 % Calculate Standard Deviation
 std_dev = std(meas(:,a));

 % Calculate Maximum
 max_val = max(meas(:,a));

 % Calculate Minimum
 min_val = min(meas(:,a));

 % Calculate Root Mean Square
 rms_val = rms(meas(:,a));

 % Display results
 fprintf('\nColumn %d = \n',a);
 fprintf('Mean: %.4f\n', mean_val);
 fprintf('Standard Deviation: %.4f\n', std_dev);
 fprintf('Maximum: %.4f\n', max_val);
 fprintf('Minimum: %.4f\n', min_val);
 fprintf('Root Mean Square: %.4f\n', rms_val);
end