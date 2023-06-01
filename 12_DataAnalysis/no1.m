clc;
clear; close all;
keyData = readmatrix('g0310/exp4i_g0310.csv');
tryTimes = 20;
mergeC = zeros(500,tryTimes);
test = zeros(1,20); % 欠損値確認
time = (-998:2:0);

for k = 1:tryTimes
    csv = readmatrix(['g0310/g0310.asc_TRIAL_' num2str(k) '.csv']);
    [sizeR, sizeC] = size(csv); % [csv_size(1,1), csv_size(1,2)]
    ms = size(csv(1,1):2:csv(sizeR,1));
    ms = ms(1,2); % 欠損値がない場合（理想）
    expos = zeros(ms,5); % 理想行列の生成
    expos(:,1) = (csv(1,1):2:csv(sizeR,1));
    expos(:,1) = expos(:,1) - expos(ms,1); % 時間軸終点を0
    csv(:,1) = csv(:,1) - csv(sizeR,1); % 時間軸終点を0
    expos(:,2:4) = -1; % Default を欠損値扱い
    bin = ismember(expos,csv); % 欠損値を0とした行列
    bin = bin(:,1);
    %【記法】 mat1(logical, col) = mat2(:, col)
    expos(bin,2) = csv(:,3);
    expos(bin,5) = csv(:,4);
    % -- expos matrix index list {[*col] [index name]}
    % --  *1 times
    % --  *2 display status
    % --  *3 Looking left or right
    % --  *4 Looking at the one you choose
    % --  *5 x-coordinate

    % expos 未欠損 && col[2]==1である -> 平均を取る
    x_coordinate_Ave = mean(expos((expos(bin,2)==1),5));
    % expos 未欠損 && 平均より大きい -> 102, otherwise -> 100
    expos(bin,3) = 100 + (expos(bin,5) > x_coordinate_Ave)*2;
    % expos 未欠損 && 左右のデータと選択が一致 -> 1, otherwise -> 0
    expos(bin,4) = (expos(bin,3) == keyData(k,2));
    % mergeC に結果を格納
    mergeC(:,k) = expos(ms-499:ms,4);
    test(1,k) = min(min(expos(:,4))); % 欠損値確認
end
% mergeC(time, logical);
ratio = zeros(500,1);
for k = 1:500
    ts = mergeC(k,1:20);
    ratio(k) = sum(ts==1)/(tryTimes-sum(ts == -1));
end
plot(time,ratio);
xlabel('time[s]');
ylabel('ratio');
axis([-1000 0 0 1]);