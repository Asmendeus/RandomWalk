function classic_2D

N = 100000;       %总粒子数
Nstep = 200;      %总步数

X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)
Y = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(纵轴)
x = zeros(1,N);  %每个粒子的横坐标
y = zeros(1,N);  %每个粒子的纵坐标

%> 固定步数Nstep, 观察最后的粒子分布
% tic;
% r = rand(Nstep,N);
% Z = zeros(2*Nstep+1,2*Nstep+1);  %统计最终坐标上的粒子数
% for i = 1:N
%     for j = 1:Nstep
%         if(r(j,i) <= 0.25)
%             x(i) = x(i)-1;
%         elseif(r(j,i) > 0.25 && r(j,i) <= 0.5)
%             x(i) = x(i)+1;
%         elseif(r(j,i) > 0.5 && r(j,i) <= 0.75 )
%             y(i) = y(i)-1;
%         else
%             y(i) = y(i)+1;
%         end
%     end
%     index_x = find(X == x(i));
%     index_y = find(Y == y(i));
%     Z(index_x,index_y) = Z(index_x,index_y) + 1;
% end
% p = Z/N;
% toc
% mesh(X,Y,p)


%> 观察粒子分布随时间(步数)的演化
tic;
r = rand(N,Nstep);
Z = zeros(Nstep,2*Nstep+1,2*Nstep+1);  %统计最终坐标上的粒子数
for i = 1:Nstep
    for j = 1:N
        if(r(j,i) <= 0.25)
            x(j) = x(j)-1;
        elseif(r(j,i) > 0.25 && r(j,i) <= 0.5)
            x(j) = x(j)+1;
        elseif(r(j,i) > 0.5 && r(j,i) <= 0.75)
            y(j) = y(j)-1;
        else
            y(j) = y(j)+1;
        end
        index_x = find(X==x(j));
        index_y = find(Y==y(j));
        Z(i,index_x,index_y) = Z(i,index_x,index_y) + 1;
    end
end
p = Z/N;
toc


%> 单个粒子随机游走
tic;
x0 = 0;
y0 = 0;
r0 = rand(1,Nstep);
site = zeros(Nstep,2*Nstep+1,2*Nstep+1);
for i = 1:Nstep
    if(r0(i)<0.25)
        x0 = x0-1;
    elseif(r0(i)>0.25 && r0(i)<0.5)
        x0 = x0+1;
    elseif(r0(i)>0.5 && r0(i)<0.75)
        y0 = y0-1;
    else
        y0 = y0+1;
    end
    index_x = find(X==x0);
    index_y = find(Y==y0);
    site(i,index_x,index_y) = 1;
end
toc


save("C:\Users\JAH\Desktop\组\random walk\classic2D\classic2D.mat","p","X","Y","Nstep","site");
fprintf("数据已导出");