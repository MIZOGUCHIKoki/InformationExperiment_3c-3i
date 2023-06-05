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
    bin = ismember(expos(:,1),csv(:,1)); % 欠損値を0とした行列
    %【記法】 mat1(logical, col) = mat2(:, col)
    expos(bin,2) = csv(:,3);
    expos(bin,5) = csv(:,4);
    % -- expos matrix index list {[*col] [index name]}
    % --  *1 times
    % --  *2 display status (1: )
    % --  *3 Looking left or right
    % --  *4 Looking at the one you choose {OK:1, MISS:0, Other -1}
    % --  *5 x-coordinate
    % 画面状態が2であることをが条件とする．
    % expos 未欠損 && col[2]==1である -> 平均を取る
    % x_coordinate_Ave = mean(expos(expos(bin,2)==1,5));
    % [min_V, min_I] = min(expos(expos(bin,2)==1,5));
    % % disp(min_V); disp(min_I);
    % temp = expos(expos(bin,2)==1,5);
    % temp2 = expos(bin,2)==1;
    center=0; count=0;
    for l=1:ms
        if(expos(l,2)==1)
            center=center+expos(l,5);
            count=count+1;
        end
    end
    x_coordinate_Ave=center/count;
    % expos 未欠損 && 平均より大きい -> 102（右）, otherwise -> 100
    expos(bin,3) = (100 + (expos(bin,5) > x_coordinate_Ave)*2).*(expos(bin,2)==2);
    expos(expos(bin,3)==0,3) = -1;
    % expos 未欠損 && 左右のデータと選択が一致 -> 1, otherwise -> 0
    expos(expos(bin,2)==2,4) = 1; % 画面状態2 :: 1
    expos(expos(bin,4)==0,4) = -1; % 画面状態2以外 :: -1（欠損値扱い）
    expos(expos(bin,4)==1,4) = (expos(expos(bin,4)==1,3) == keyData(k,2));
    % mergeC に結果を格納
    mergeC(:,k) = expos(ms-499:ms,4);
    test(1,k) = min(min(expos(:,4))); % 欠損値確認
end
% mergeC(time, logical);
ratio = zeros(500,1);
for k = 1:500
    ts = mergeC(k,1:20);
    ratio(k) = sum(ts==1)/(tryTimes-sum(ts == -1));
    disp(tryTimes-sum(ts == -1));
end
plot(time,ratio);
xlabel('time[s]');
ylabel('ratio');
axis([-1000 0 0 1]);