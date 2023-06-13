clear; close all;
d = importdata('data.csv',',',3);
data = d.data;
data(:,1) = [];

[people, setnum] = size(data);
ave_data = mean(data); % 各列の期待値
var_data = var(data); % 各列の不偏分散
std_data = std(data); % 各列の標準偏差
err_data = std_data/sqrt(people); % 標準誤差
setsize = [4 8 16];
fig1 = figure;
hold on;
errorbar(setsize, ave_data(1:3), err_data(1:3),'-',LineWidth=1); % YES / C
errorbar(setsize, ave_data(7:9), err_data(7:9),'-',LineWidth=1); % YES / CL
errorbar(setsize, ave_data(4:6), err_data(4:6),'-',LineWidth=1); % NO / C
errorbar(setsize, ave_data(10:12), err_data(10:12),'-',LineWidth=1); % NO / CL
hold off;
axis([3 17 700 1700]);
xticks([4 8 16])
lgd = legend({'YES / C','YES / CL','NO / C', 'NO / CL'},'Location','northwest');
title(lgd,'Target / Target type');
box on;
xlabel('Set size');
ylabel('Response time average [ms]');
exportgraphics(fig1,'../Figures/14_01_graph.pdf','ContentType','vector');
