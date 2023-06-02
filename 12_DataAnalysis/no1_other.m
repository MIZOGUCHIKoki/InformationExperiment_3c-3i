clear;close all;
keyData = csvread("g0310/exp4i_g0310.csv");
tryNum = 20;    %試行回数
result = zeros(500,tryNum+1);   %結果を格納するベクトル

result(:,1) = (-998:2:0);   %1列目は時間(キー押下時を0とした時間[ms])

%サンプルコードの5行目以降

for k=1:tryNum
data = csvread(['g0310/g0310.asc_TRIAL_' num2str(k) '.csv']); %データ読み込み
[sizeR, sizeC] = size(data);    %サイズ取得
t1 = (data(1,1):2:data(sizeR,1));   %キーが押下されるまでの時間帯(理想的)
expos = zeros(length(t1),5);    %データをまとめるための行列
t2 = (data(1,1)-data(sizeR,1):2:0);   %キー押下時を0にした時間帯(理想的)
expos(:,1) = t2;    
expos(:,2:4) = -1;  %デフォルトで欠損扱いにする

ok = ismember(t1,data(:,1));    %しっかりサンプリングできていたら1ほかは0
expos(ok,2) = data(:,3);    %サンプリング出来ている時間だけデータを移す(画面の状態)
expos(ok,5) = data(:,4);    %サンプリング出来ている時間だけデータを移す(左目のx座標)

xAve = mean(expos((expos(ok,2)==1),5)); %欠損してない且つ注視点表示時のxの値の平均値
expos(ok,3) = 100 + (expos(ok,5) > xAve)*2; %中心より小さければ100,大きければ102
expos(ok,4) = (keyData(k,2) == expos(ok,3));    %キーと見ている方が同じだったら1そうでなければ0
result(:,k+1) = expos(expos(:,1)>=-998,4);  %最後の1秒のデータだけ抽出

str = ['expos_',num2str(k),'=expos;'];  %途中の結果を残しておく
eval(str);
end

%サンプルコードの21行目以降

y = 0;  %確率を格納するベクトル
for k = 1:500
    mat = result(k,(2:tryNum+1));   %時刻kの全体
    kesson = mat==-1;   %時刻kの欠損しているところだけ1あとは0
    y(k) = sum(mat==1)/(tryNum-sum(kesson));    %1の数/欠損しているデータを除いた回数
end

%グラフ
plot(-998:2:0,y);
xlabel("時間[ms]");
ylabel("割合");
title("各時刻における魅力的だと判断した方を見ている割合")
axis([-998 0 0 1]);
