% import data
% 1: 学籍番号
% 2: 練習/本番（1/2）
% 3: 試行回数
% 4: 目標刺激の有無（1;あり, 2;なし）
% 5: 目標刺激種類
% 6: 刺激総数
% 7: 入力状態（0;正解, 1;失敗, 2;その他のキー, 3;Timeout）
% 8: 解答にかかった時間（ms）
clear; close all;
file = importdata('data1250373_2.txt', ',',  1);
data = file.data;
practice = data(:,2) == 1; % 練習
error = data(:,7) > 0; % Error
del = practice | error;
data(del,:) = []; % 削除操作

% -- 目標刺激（あり），目標刺激種類（マル）
target = data(:,4)==1;
type = data(:,5)==1;
setsize4 = data(:,6)==4; % 4
target_type1_size4_mean = mean(data(target & setsize4 & type, 8));
target = data(:,4)==1;
type = data(:,5)==1;
setsize8 = data(:,6)==8; % 8
target_type1_size8_mean = mean(data(target & setsize8 & type, 8));
target = data(:,4)==1;
type = data(:,5)==1;
setsize16 = data(:,6)==16; % 16
target_type1_size16_mean = mean(data(target & setsize16 & type, 8));

% -- 目標刺激（あり），目標刺激種類（マル線）
target = data(:,4)==1;
type = data(:,5)==2;
setsize4 = data(:,6)==4; % 4
target_type2_size4_mean = mean(data(target & setsize4 & type, 8));
target = data(:,4)==1;
type = data(:,5)==2;
setsize8 = data(:,6)==8; % 8
target_type2_size8_mean = mean(data(target & setsize8 & type, 8));
target = data(:,4)==1;
type = data(:,5)==2;
setsize16 = data(:,6)==16; % 16
target_type2_size16_mean = mean(data(target & setsize16 & type, 8));

% -- 目標刺激（なし），目標刺激種類（マル）
target = data(:,4)==2;
type = data(:,5)==1;
setsize4 = data(:,6)==4; % 4
ntarget_type1_size4_mean = mean(data(target & setsize4 & type, 8));
target = data(:,4)==2;
type = data(:,5)==1;
setsize8 = data(:,6)==8; % 8
ntarget_type1_size8_mean = mean(data(target & setsize8 & type, 8));
target = data(:,4)==2;
type = data(:,5)==1;
setsize16 = data(:,6)==16; % 16
ntarget_type1_size16_mean = mean(data(target & setsize16 & type, 8));

% -- 目標刺激（なし），目標刺激種類（マル線）
target = data(:,4)==2;
type = data(:,5)==2;
setsize4 = data(:,6)==4; % 4
ntarget_type2_size4_mean = mean(data(target & setsize4 & type, 8));
target = data(:,4)==2;
type = data(:,5)==2;
setsize8 = data(:,6)==8; % 8
ntarget_type2_size8_mean = mean(data(target & setsize8 & type, 8));
target = data(:,4)==2;
type = data(:,5)==2;
setsize16 = data(:,6)==16; % 16
ntarget_type2_size16_mean = mean(data(target & setsize16 & type, 8));

x = [4, 8, 16];
mean_type1 = [target_type1_size4_mean target_type1_size8_mean target_type1_size16_mean];
mean_type2 = [target_type2_size4_mean target_type2_size8_mean target_type2_size16_mean];
mean_type3 = [ntarget_type1_size4_mean ntarget_type1_size8_mean ntarget_type1_size16_mean];
mean_type4 = [ntarget_type2_size4_mean ntarget_type2_size8_mean ntarget_type2_size16_mean];

fig1 = figure;
hold on;
plot(x,mean_type1,'-o',LineWidth=2);
plot(x,mean_type2,'-square',LineWidth=2);
plot(x,mean_type3,':o',LineWidth=2);
plot(x,mean_type4,':square',LineWidth=2);
hold off;
lgd = legend({'YES / C','YES / CL','NO / C', 'NO / CL'},'Location','northwest');
title(lgd,'Target / Target type');
xticks([0 4 8 16 20]);
yticks(800:100:2200)
xlabel('Set size');
ylabel('Response time average [ms]');
exportgraphics(fig1,'../Figures/13_01_graph.pdf','ContentType','vector');