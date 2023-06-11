clear; close all;
keyData = readmatrix('g0310/exp4i_g0310.csv');
tryTime = 1;
mergeC = zeros(500, tryTime);
time = (-998:2:0);
for k = 1:20
    csv = readmatrix(['g0310/g0310.asc_TRIAL_' num2str(k) '.csv']);
    [sizeR, sizeC] = size(csv);
    ms = size(csv(1,1):2:csv(sizeR,1));
    ms = ms(1,2); % 欠損値がない場合の理想時間軸
    expos = zeros(ms,5);
    expos(:,1) = csv(1,1):2:csv(sizeR,1);
end