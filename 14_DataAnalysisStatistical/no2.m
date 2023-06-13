clear; close all;
d = importdata('data.csv',',',3);
data = d.data;
data(:,1) = [];
[people, setnum] = size(data);
setsize = [4 8 16];
x = setsize;
slope = zeros(people, 3);
for k=1:people
    y = data(k,1:3);
    p_circle = polyfit(x,y,1);
    slope(k,1) = p_circle(1);
    y = data(k,7:9);
    p_circle = polyfit(x,y,1);
    slope(k,2) = p_circle(1);
    slope(k,3) = p_circle(1) - p_circle(2);
end
mynum = 2;
fig1 = figure;
hold on;
y = data(mynum,1:3);
plot(x,y,'o',LineWidth=2);
p_circle = polyfit(x,y,1);
a = p_circle(:,1);
b = p_circle(:,2);
y1 = a * x + b;
y = data(mynum, 7:9);
plot(x,y,'x',LineWidth=2);
p_circle_bar = polyfit(x,y,1);
a = p_circle_bar(:,1);
b = p_circle_bar(:,2);
y2 = a * x + b;
plot(x, y1, x, y2, LineWidth=2);
leg = legend('Data point / C','Data point / CL', 'Regression line / C', 'Regression line / CL','Location','northwest');
title(leg, 'Genre / Target type')
axis([3 17 900 1600]);
xticks([4 8 16])
box on;
hold off;
exportgraphics(fig1,'../Figures/14_02_graph.pdf','ContentType','vector');