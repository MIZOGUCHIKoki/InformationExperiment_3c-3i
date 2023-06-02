clear;

answer=csvread(['./g0310/exp4i_g0310.csv']);

margeC=zeros(500,21);
margeC(:,1)=(-998:2:0);

for k=1:20
    csv=csvread(['./g0310/g0310.asc_TRIAL_' num2str(k) '.csv']);
    [h,w]=size(csv);
    ms=size([csv(1,1):2:csv(h,1)]);
    expos=zeros(ms(1,2),5);
    
    expos(:,1)=[csv(1,1):2:csv(h,1)]';
    expos(:,1)=expos(:,1)-expos(ms(1,2),1);
    csv(:,1)=csv(:,1)-csv(h,1);
    
    expos(:,2:4)=-1;
    
    ok=ismember(expos(:,1),csv(:,1));
    
    expos(ok,2)=csv(:,3);
    expos(ok,5)=csv(:,4);
    
    center=0; count=0;
    for l=1:ms(1,2)
        if(expos(l,2)==1)
            center=center+expos(l,5);
            count=count+1;
        end
    end
    ctr=center/count;
    
    for l=1:ms(1,2)
        if(expos(l,2)==2)
            if(expos(l,5)<=ctr)
                expos(l,3)=100;
            elseif(expos(l,5)>ctr)
                expos(l,3)=102;
            end
        end
    end
    
    for l=1:ms(1,2)
        if(expos(l,3)==answer(k,2))
            expos(l,4)=1;
        elseif(expos(l,3)~=answer(k,2) && expos(l,3)~=-1)
            expos(l,4)=0;
        end
    end
    margeC(:,k+1)=expos(ms(1,2)-499:ms(1,2),4);
    text(1:k) = min(min(expos(:,4)));
end

ratio=zeros(1,500);
for k=1:500
    ok2=~ismember(margeC(k,2:21),-1);
    count=0;
    for l=1:20
        if(ok2(1,l))
            ratio(1,k)=ratio(1,k)+margeC(k,l+1);
            count=count+1;
        end
    end
    Last(1,k)=ratio(1,k)/count;
end

plot(margeC(:,1),Last);
xlabel('Time[ms]');
ylabel('Response Rate');
axis([-1000 0 0 1]);