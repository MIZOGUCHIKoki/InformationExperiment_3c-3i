clear; close all;
keyData = readmatrix('g0310/exp4i_g0310.csv');
tryTime = 20;
margeC = zeros(500, tryTime);
time = (-998:2:0);
for k = 1:tryTime
    csv = readmatrix(['g0310/g0310.asc_TRIAL_' num2str(k) '.csv']);
    [sizeR, sizeC] = size(csv);
    ms = size(csv(1,1):2:csv(sizeR,1));
    ms = ms(1,2); % 欠損値がない場合の理想時間軸
    expos = zeros(ms,5);
    expos(:,1) = csv(1,1):2:csv(sizeR,1);
    expos(:,1) = expos(:,1) - expos(ms,1);
    csv(:,1) = csv(:,1) - csv(sizeR,1);
    expos(:,2:4) = -1; % Defaultで欠損値扱い
    bin = ismember(expos(:,1),csv(:,1));
    expos(bin,2) = csv(:,3);
    expos(bin,5) = csv(:,4);
    counter = 0; count = 0;
    for m = 1:ms
        if(expos(m,2)==1) % 画面状態が1（表示中）
            counter = counter + expos(m,5); % x-coordinate 加算
            count = count + 1;
        end
    end
    x_coordinate_Ave = counter/count;
    for m = 1:ms
        if(expos(m,2)==2)
           if(expos(m,5) <= x_coordinate_Ave) 
               expos(m,3) = 100;
           elseif(expos(m,5) > x_coordinate_Ave)
               expos(m,3) = 102;
           end
        end
    end
    for m = 1:ms
        if(expos(m,3)==keyData(k,2))
            expos(m,4) = 1;
        elseif(expos(m,3)~=keyData(k,2) && expos(m,3)~=-1)
            expos(m,4) = 0;
        end
    end
    margeC(:,k) = expos(ms-499:ms,4);
end
ratio = zeros(500,1);
for k=1:500
    ts = margeC(k,:);
    ratio(k) = sum(ts==1)/(tryTime-sum(ts==-1));
end
fig1 = figure;
box on;
plot(time,ratio);
axis([-1000 0 0 1]);
xlabel('time[ms]');
ylabel('ratio');
exportgraphics(fig1,'../Figures/12_01_graph.pdf','ContentType','vector');